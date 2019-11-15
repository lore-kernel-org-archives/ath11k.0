Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXup-0002Nw-VQ
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:29:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 00/49] ath11k: driver for Qualcomm IEEE 802.11ax devices
Date: Fri, 15 Nov 2019 11:28:24 +0200
Message-Id: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
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
the final version will be split into three commits:

1. adding Documentatio/devicetree/bindings/net/wireless/qcom,ath11k.yaml

2. adding drivers/net/wireless/ath/ath11k/ with the commit log being the
   text before the cut line above.

3. adding ath11k entry to MAINTAINERS file

This version is based on commit ad10d2ff619f0797cb102b2ff488429d3f8e4a8a
from ath11k-bringup branch on my ath.git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-bringup

This patchset applies to wireless-drivers-next but needs
CONFIG_COMPILE_TEST, CONFIG_REMOTEPROC AND CONFIG_QCOM_QMI_HELPERS to
be able to compile on x86.

Please review and comment.

Kalle

v3:

* Fixes and license change to Device Tree bindings document

* git log --oneline --reverse ath11k-review-v2..ath11k-review-v3:

51dcdfd7a2bf ath11k: fix ATH11K_TRACING kconfig help text
b6b50cbae8a1 dt: bindings: net: ath11k: fix whitespace
2120332777dd dt: bindings: net: ath11k: fixes from review
93804d04c6d6 dt: bindings: net: ath11k: change license

v2:

* There are three final patches to commit, not just one.

* Write commit log for the device tree bindings patch.

* License changed to BSD 3-clause "Clear".

* git log --oneline --reverse ath11k-review-v1..ath11k-review-v2:

f6153fa78616 ath11k: fix Kconfig, replace spaces with tabs
b6b140aa1739 ath11k: Use C99 structure initialization for target_service_to_ce_map_wlan[]
d054355585aa ath11k: Remove ring mask macros defined for 0
4c980dcca60a ath11k: Move ath11k_ahb_read32() and ath11k_ahb_write32() to ahb.h
be7eb8bbca02 ath11k: Avoid code duplication in set/clear of a register bit values
11978c109885 ath11k: Few clean ups in comments
8cc72b480777 ath11k: Clean ups in ath11k_ce_rx_buf_enqueue_pipe() error path
9f55e5658237 ath11k: Clean up parameter list in ath11k_ce_completed_send_next()
3dcb3e76a260 ath11k: Use struct_size() to get the structure size with trailing array
a1329c05a4e0 ath11k: change license to BSD 3-clause "Clear"
bcd3f5043856 ath11k: fix multicast rate parameter size
e4386fb86f51 ath11k: assigning values to enum
78b6da0fb67c ath11k: Add debugfs per chip
e44597a02dad ath11k: fix tkip mic error reporting to cfg80211
ea1107a93b4a dt-bindings: net: add qcom,ath11k.yaml
ab4d2bd0f217 ath11k: whitespace cleanup in core.c



_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
