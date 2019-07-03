Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hicLo-0003nm-Tt
 for ath11k@lists.infradead.org; Wed, 03 Jul 2019 10:18:58 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v4 0/3] mac80211/ath11k: HE mesh support
Date: Wed,  3 Jul 2019 12:18:36 +0200
Message-Id: <20190703101839.18827-1-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, Sven Eckelmann <sven@narfation.org>

Hi,

Some features of 802.11ax without central organizing (AP) STA can also be
used in mesh mode. The main goal is to get HE mesh working with ath11k.
For persons without ath11k compatible hw, hwsim can be used in the as basis
for further development of these features.

* v4

  - switch order of the mac80211 HE mesh support and mac80211_hwsim support
  - drop ie_len variable from ieee80211_ie_len_he_cap and
    ieee80211_ie_build_he_oper
  - switch to function ieee80211_get_he_iftype_cap instead of implementing new
    function ieee80211_get_he_mesh_cap
  - allow ieee80211_ie_len_he_cap to calculate length for non-mesh HE cap
  - dropped he_support workaround in ath11k because now all phy_modes are
    HE phy modes

* v3

  - force ath11k PHY mode for meshpoint vif to HE mode to avoid hang of
    firmware when HE (or VHT on 2.4GHz) device tries to connect

* v2:

  - add of ath11k patch

* v1:

  - initial RFC

Sven Eckelmann (3):
  mac80211: implement HE support for mesh
  mac80211_hwsim: Register support for HE meshpoint
  ath11k: register HE mesh capabilities

 drivers/net/wireless/ath/ath11k/mac.c |  56 +++++
 drivers/net/wireless/mac80211_hwsim.c | 283 +++++++++++++++++---------
 net/mac80211/ieee80211_i.h            |   2 +
 net/mac80211/mesh.c                   |  62 ++++++
 net/mac80211/mesh.h                   |   4 +
 net/mac80211/mesh_plink.c             |  12 +-
 net/mac80211/util.c                   |  49 +++++
 7 files changed, 373 insertions(+), 95 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
