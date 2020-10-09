Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQhzC-0008L2-OY
 for ath11k@lists.infradead.org; Fri, 09 Oct 2020 02:18:24 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 0/4] ath11k: add support for 256 bitmap in Block ack and
 duration based RTS threshold
Date: Thu,  8 Oct 2020 19:18:07 -0700
Message-Id: <20201009021811.18584-1-pradeepc@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

This series adds support for the configuration of following in
HE capable ath11k APs:
1. TXOP duration based RTS threshold using HE Operation parameters in
   beacons for AP and mesh modes.
2. BlockAck's bitmap to support upto 256 bits in mesh mode. Without
   this maximum of 64 bits are supported in BlockAck bitmap.

mac80211 patch sets he_support flag for mesh BSS and addresses
previous review comments from https://patchwork.kernel.org/patch/11664077/

Pradeep Kumar Chitrapu (4):
  mac80211: save HE oper info in BSS config for mesh
  ath11k: fix incorrect wmi param for configuring HE operation
  ath11k: support TXOP duration based RTS threshold
  ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax

 drivers/net/wireless/ath/ath11k/mac.c | 40 +++++++++++++++++----------
 drivers/net/wireless/ath/ath11k/wmi.h |  2 +-
 include/net/mac80211.h                |  3 +-
 net/mac80211/mesh.c                   | 30 ++++++++++++++++++++
 4 files changed, 58 insertions(+), 17 deletions(-)


base-commit: ba6ff70a3bb76c1ff440d3a0044b82e97abb648f
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
