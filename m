Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiHR-0006JW-4d
 for ath11k@lists.infradead.org; Tue, 26 May 2020 22:42:46 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v3 0/9] add 6GHz radio support in ath11k driver
Date: Tue, 26 May 2020 15:42:08 -0700
Message-Id: <20200526224217.11119-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

This patch series adds 6GHz frequency listing in ath11k driver and mac80211
registration for the 6GHz band. Also, extends some of wmi command tlvs for
supporting 6GHz.

In cfg80211, a helper function is added for identifying Preferred Scanning
Channels (PSC) in 6GHz band.

changes in v3:
 - cfg80211: remove PSC channel flag and instead add helper function.
 - Address differences in 6GHZ frequencies between IEEE P802.11ax/D6.0
   and IEEE P802.11ax/D6.1

changes in v2:
 - Fixed ath11k_phymode to be set in 6GHZ band

Pradeep Kumar Chitrapu (9):
  cfg80211: Add helper function to identify 6GHz PSC channel
  ath11k: add 6G frequency list supported by driver
  ath11k: add support for 6GHz radio in driver
  ath11k: Use freq instead of channel number in rx path
  ath11k: extend peer_assoc_cmd for 6GHz band
  ath11k: set psc channel flag when sending channel list to firmware.
  ath11k: Add 6G scan dwell time parameter in scan request command
  ath11k: Send multiple scan_chan_list messages if required
  ath11k: Add support for 6g scan hint

 drivers/net/wireless/ath/ath11k/core.h  |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |   6 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 174 +++++++++++++--
 drivers/net/wireless/ath/ath11k/reg.c   |   4 +
 drivers/net/wireless/ath/ath11k/wmi.c   | 269 +++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/wmi.h   |  40 +++-
 include/net/cfg80211.h                  |  24 +++
 7 files changed, 425 insertions(+), 98 deletions(-)

-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
