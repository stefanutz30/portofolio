<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
  exclude-result-prefixes="sitemap">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/sitemap:urlset">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Site Map</title>
        <style>
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            background: radial-gradient(circle at top left, #0b0c1a 0%, #060717 60%, #02030a 100%);
            color: #e6e9ff;
            font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif;
            min-height: 100vh;
            padding: 40px 24px;
          }
          .wrap {
            max-width: 960px;
            margin: 0 auto;
          }
          h1 {
            font-size: 44px;
            line-height: 1.1;
            background: linear-gradient(135deg, #00f2fe 0%, #4facfe 50%, #a855f7 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            letter-spacing: -1px;
            margin-bottom: 6px;
          }
          .sub {
            color: #9aa3d6;
            font-size: 14px;
            margin-bottom: 28px;
          }
          .panel {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 16px;
            padding: 18px;
            backdrop-filter: blur(10px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.4), inset 0 1px 0 rgba(255,255,255,0.06);
            overflow: auto;
          }
          table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 14px;
          }
          thead th {
            text-align: left;
            padding: 14px 16px;
            color: #9aa3d6;
            font-weight: 500;
            font-size: 12px;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            border-bottom: 1px solid rgba(255,255,255,0.08);
            white-space: nowrap;
          }
          tbody tr td {
            padding: 16px;
            border-bottom: 1px solid rgba(255,255,255,0.06);
            vertical-align: middle;
          }
          tbody tr:last-child td { border-bottom: none; }
          tbody tr:hover td { background: rgba(255,255,255,0.03); }
          .loc a {
            color: #9cdcff;
            text-decoration: none;
            background: linear-gradient(180deg, rgba(0,242,254,0.15), rgba(79,172,254,0.05));
            padding: 6px 10px;
            border-radius: 10px;
            border: 1px solid rgba(0,242,254,0.25);
            transition: border-color .2s ease, color .2s ease;
          }
          .loc a:hover {
            border-color: rgba(0,242,254,0.6);
            color: #fff;
          }
          .chip {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 500;
          }
          .chip-high { background: rgba(168,85,247,0.15); color: #c9a0ff; border: 1px solid rgba(168,85,247,0.3); }
          .chip-med { background: rgba(79,172,254,0.12); color: #8fd1ff; border: 1px solid rgba(79,172,254,0.25); }
          .empty { color: #7a83b8; font-style: italic; }
          footer {
            margin-top: 28px;
            color: #6a6f96;
            font-size: 12px;
          }
        </style>
      </head>
      <body>
        <div class="wrap">
          <h1>Site Map</h1>
          <div class="sub">Page index — inline anchors are supplemental signals for search engines.</div>
          <div class="panel">
            <table>
              <thead>
                <tr>
                  <th>URL</th>
                  <th>Last Modified</th>
                  <th>Change Frequency</th>
                  <th>Priority</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="sitemap:url">
                  <tr>
                    <td class="loc">
                      <a>
                        <xsl:attribute name="href"><xsl:value-of select="sitemap:loc"/></xsl:attribute>
                        <xsl:attribute name="title"><xsl:value-of select="sitemap:loc"/></xsl:attribute>
                        <xsl:value-of select="sitemap:loc"/>
                      </a>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="sitemap:lastmod">
                          <xsl:value-of select="sitemap:lastmod"/>
                        </xsl:when>
                        <xsl:otherwise><span class="empty">—</span></xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="sitemap:changefreq">
                          <span class="chip">
                            <xsl:value-of select="sitemap:changefreq"/>
                          </span>
                        </xsl:when>
                        <xsl:otherwise><span class="empty">—</span></xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="sitemap:priority">
                          <span class="chip">
                            <xsl:choose>
                              <xsl:when test="number(sitemap:priority) &gt;= 1"><xsl:attribute name="class">chip chip-high</xsl:attribute>1.0</xsl:when>
                              <xsl:when test="number(sitemap:priority) &gt;= 0.75"><xsl:attribute name="class">chip chip-high</xsl:attribute><xsl:value-of select="sitemap:priority"/></xsl:when>
                              <xsl:otherwise><xsl:attribute name="class">chip chip-med</xsl:attribute><xsl:value-of select="sitemap:priority"/></xsl:otherwise>
                            </xsl:choose>
                          </span>
                        </xsl:when>
                        <xsl:otherwise><span class="empty">—</span></xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <footer>Automatically generated sitemap preview.</footer>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
