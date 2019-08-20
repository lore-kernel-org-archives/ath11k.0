Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06Mw-0001A4-1i
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 15:48:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 00/49] ath11k: driver for Qualcomm IEEE 802.11ax devices
Date: Tue, 20 Aug 2019 18:47:26 +0300
Message-Id: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

ath11k is a new driver for Qualcomm IEEE 802.11ax devices, first
supporting only IPQ8074 SoC using the shared memory AHB bus. ath11k
uses mac80211 and supports AP, Station and Mesh modes.

Even though ath11k has some similar code as with ath10k (especially
the WMI layer) it was concluded to be simpler to have a "clean start"
for ath11k code base and not try to share the code with ath10k. This
makes maintenance easier and avoids major changes in ath10k, which
would have significantly increased the risk of regressions in existing
setups.

Even though the driver is very similar with ath10k but there are major
differences as well. The datapath is completely different. ath11k
supports multiple MACs, called "soc" in the firmware interface. And
there's only one WMI interface to support.

Currently ath11k supports only IEEE 802.11ac mode, but patches for
802.11ax are available and they will be submitted after ath11k is
accepted to upstream.

The firmware images are available from ath11k-firmware repository but
they will be also submitted to linux-firmware:

https://github.com/kvalo/ath11k-firmware

The driver has had multiple authors who are listed in alphabetical
order below.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Signed-off-by: Miles Hu <milehu@codeaurora.org>
Signed-off-by: Muna Sinada <msinada@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

--------------[cut]-------------------[cut]-----------------

I have split the driver into multiple patches for easier review, but
the final commit will be one big patch and the commit log being the
text before the cut line above.

This version is based on commit b05c1a55a3a566893e15cfc2dc2cc20d476af0d6
from ath11k-bringup branch on my ath.git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-bringup

This patch applies to wireless-drivers-next but needs
CONFIG_COMPILE_TEST, CONFIG_REMOTEPROC AND CONFIG_QCOM_QMI_HELPERS to
be able to compile on x86.

Please review and comment.

Kalle



_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
