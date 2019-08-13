Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxT5x-0001lD-3D
 for ath11k@lists.infradead.org; Tue, 13 Aug 2019 09:27:59 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [RFC PATCH v6 0/2] ath11k: HE mesh support
Date: Tue, 13 Aug 2019 11:27:24 +0200
Message-Id: <20190813092726.28074-1-sven@narfation.org>
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
To: ath11k@lists.infradead.org
Cc: Sven Eckelmann <seckelmann@datto.com>

From: Sven Eckelmann <seckelmann@datto.com>

Hi,

Some features of 802.11ax without central organizing (AP) STA can also be
used in mesh mode. The main goal was to get HE mesh working with ath11k.
But the support for HE was completely removed from ath11k [1]. So these RFC
patches are just stuff which doesn't apply anymore because of this and are
just dropped here to have some (more or less) clean dump in case HE is
added again at some point.

Kind regards,
	Sven

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=50ca7786c26fba9db211ed89843e0da47b0cfbc0

* v6

  - remove upstream merged mac80211 patch
  - send only the ath11k relevant patches
  - drop (internal DEP-3-like) "Forwarded:" tag
  - switch from PATCH to RFC due to dropped HE support in ath11k

* v5

  - rebased patches
  - moved ath11k meshpoint HE capabilities filter to avoid lines over 80
    characters
  - add patch to disable HE SU phy capabilities to work around problems
    with WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1 firmware

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

Sven Eckelmann (2):
  ath11k: register HE mesh capabilities
  ath11k: Disable SU support in meshpoint mode

 drivers/net/wireless/ath/ath11k/mac.c | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
