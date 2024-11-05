Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA7D12660
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MWAEo/MiBLSGQo4QI+EYwMLffZpqLeTX36oXctu4MJs=; b=gR8rWB/3EHun28+pgkE7wzPaSU
	ra4UNDA3Ql5K6U52hiCaBk3yGSj5BD/cxNm8gBjzGnzlRO0NGDcHrJHgdKpdldbylP2viePXrR6Oa
	+4WgPgHvQWaT4y6XA2CDbC+ESm74I7pgMU+UH8uoW+ckK+06uYLScy1aSGtoFbSDOs+2P8DHNdu/N
	deaIDZcYVbiR2dDtgFeyzld5TeY+zuRK6yEfpQSGODF0C6K2GgNrod21WUZK1V5FCkfUAgeRkqWEn
	w2bf2qxZjQQ6FHIhRRhvZGaghUaHyOG8lKDd3rUzsB+U0/CLNeioYILVuaJlYBmomHcIRBEUvrCr3
	Po4uy0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EjY-0000000GIy8-1umY;
	Tue, 05 Nov 2024 08:16:16 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfC-0000000G9Te-2YZF
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790460; bh=iYwvr/LEIVappZveHmCKXZajLKoGm6AGWdp3otq9Lxw=;
	h=From:To:Cc:Subject:Date:From;
	b=TLAG980k67M6c4Ao/cvO1OO6yZn7H6mKLUSZzKHbKZXA0ZKGaeNKoFMVhnoYOpwPo
	 J00PLsxEQiv4XhUoBeeVJxTGCY1ewqgloovRZnqKVEUOzMQpUPTKdTI6xJHSSg8syk
	 M8dkRUAYLe0gBYl5rbur0ykGOAFogU+t+7V2P83M=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 1B7061480CC6;
	Tue, 05 Nov 2024 08:07:40 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 00/11] ath1{1,2}k: support multiple PCI devices in one system
Date: Tue,  5 Nov 2024 08:06:14 +0100
Message-ID: <cover.1730790058.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230742_855994_3078CD07 
X-CRM114-Status: GOOD (  27.01  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k and ath12k suffer from a long-standing issue that is partly
caused by the QRTR implementation, which only supports one device per
node/port combination and partly caused by the fact that the
QMI instance ID of the devices are statically set to 1.

P Praneesh <quic_ppranees@quicinc.com> submitted a patch[0] that fixes
this issue generating a unique QMI instance ID based on the PCI bus data
for the device and passing that information to the QMI subsystem and the
device's firmware via a special PCI register.

However, it quickly turned out that this approach works for the hardware
he tested, but fails for other ath11k-based devices, including the
popular QCA6930, since its firmware just ignores the special register
being used.

Since we need QMI (and, for matter, QRTR) to work for the initial
firmware upload, this approach will not work generically.

Fortunately, Denis Kenzior <denkenz@gmail.com> cooked up a patch set for
QRTR[1] that introduces the concept of endpoint IDs, which are
dynamically allocated and can be used to distinguish different devices
even though they use the same node/port combination. Using this patch
set, endpoint IDs can be reported as part of auxillary data in the QRTR
socket and bound to for client sockets, which will automatically filter
mssages from other endpoints and also make sure that messages clients
send are routed to the correct endpoint.

This looked promising, and with that functionality, the only challenge
is to find out the correct endpoint IDs and bind to them in drivers to
finally support multiple devices in a generic way.

This patch set implements exactly that, and it WORKSFORME, but
unfortunately it turns out that "the only challenge" is very difficult
to overcome due to the socket-based architecture.

ath1{1,2}k and QRTR are at opposite sides of the socket, with QRTR
assigning endpoint IDs and ath1{1,2}k needing a way to fetch and operate
on them.

The endpoint reporting feature in QRTR is not helpful in this case,
because drivers do not generally know which endpoint belongs to the
device they currently handle (i.e., there is no central registry) and
even if we were to snoop on the socket and take the first endpoint ID we
are unaware of, this might not be the correct one, because it might be
in use by a different driver for instance, or correspond to a different
device.

The only way I found to communicate endpoint IDs between QRTR and the
drivers is to use MHI as the common layer utilized by both systems.
Since QRTR is using MHI as one underlying bus system, we can extend
struct mhi_device with a qrtr_endpoint_id field, initialize this to zero
(which is an invalid QRTR endpoint ID), have QRTR go through an
mhi_dev->mhi_cntrl->mhi_dev chain to select the MHI controller of the
device it is currently initializing for, save the newly assigned
endpoint ID to the MHI controller's mhi_device structure and do the same
for our device drivers ath1{1,2}k for fetching the endpoint ID QRTR
associated with the MHI controller.

This is not only incredibly ugly, because it essentially is a weird
pseudo-IPC implementation using the MHI bus device data space as a
communication platform, it comes short because of multiple issues:

  - The timing is critical. Since QRTR assigns endpoint IDs, clients can
    not query them before QRTR has been initialized for a specific
    device.
  - We would actually like to know the QRTR endpoint ID beforehand and
    bind to it BEFORE creating the QRTR/QMI socket, to not receive
    messages from other endpoints we are not interested in or send
    messages to wrong endpoints! But since there is no central registry
    for endpoint IDs, we cannot blindly assign just any ID from clients,
    and even if we could, the current architecture relies on QRTR doing
    it.
  - We should not use struct mhi_device to handle QRTR data. Obviously.
  - We are assuming that each device we are handling has a unique MHI
    controller associated with it, and also only one. This might not at
    all be true...

Personally, I am not comfortable with the patch set in its current form.
While it does fix the initial problem, it is not elegant in any way, and
I am aware of other issues, like not being able to unload the qrtr
module once it has been used (refcount only drops down to 2, even though
there is nothing still using it). I have not debugged this yet, and this
issue might have been introduced by Denis's changes, but I would not
find it hard to believe that my changes introduced a subtle refcount
increase that I am not aware of either.

Even with these issues, this patch set might be useful in the future and
it proves that multiple devices can work in one machine.

[0] https://patch.msgid.link/20230111170033.32454-1-kvalo@kernel.org
[1] https://patch.msgid.link/20241018181842.1368394-1-denkenz@gmail.com

Mihai Moldovan (11):
  bus: mhi: host: add QRTR endpoint ID to mhi_device
  net: qrtr: mhi: pass endpoint ID to MHI device on init
  soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
  soc: qcom: qmi_helpers: optionally bind to QRTR endpoint ID in
    qmi_sock_create
  wifi: ath11k: add QRTR endpoint ID hif feature
  wifi: ath11k: stub QRTR endpoint ID fetching for AHB
  wifi: ath11k: implement QRTR endpoint ID fetching for PCI
  wifi: ath11k: bind to QRTR endpoint ID in ath11k_qmi_ops_new_server
  wifi: ath12k: add QRTR endpoint ID hif feature
  wifi: ath12k: implement QRTR endpoint ID fetching for PCI
  wifi: ath12k: bind to QRTR endpoint ID in ath12k_qmi_ops_new_server

 drivers/bus/mhi/host/init.c           |  1 +
 drivers/bus/mhi/host/main.c           | 64 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ahb.c |  7 +++
 drivers/net/wireless/ath/ath11k/hif.h |  8 ++++
 drivers/net/wireless/ath/ath11k/mhi.c | 17 +++++++
 drivers/net/wireless/ath/ath11k/mhi.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c |  1 +
 drivers/net/wireless/ath/ath11k/qmi.c | 50 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/qmi.h |  1 +
 drivers/net/wireless/ath/ath12k/hif.h |  9 ++++
 drivers/net/wireless/ath/ath12k/mhi.c | 17 +++++++
 drivers/net/wireless/ath/ath12k/mhi.h |  2 +
 drivers/net/wireless/ath/ath12k/pci.c |  1 +
 drivers/net/wireless/ath/ath12k/qmi.c | 49 ++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h |  1 +
 drivers/soc/qcom/qmi_interface.c      | 28 ++++++++++++
 include/linux/mhi.h                   | 20 +++++++++
 include/linux/soc/qcom/qmi.h          |  3 ++
 net/qrtr/mhi.c                        |  4 ++
 19 files changed, 284 insertions(+)

-- 
2.45.2


