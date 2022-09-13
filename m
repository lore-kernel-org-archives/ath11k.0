Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE26C54EE9
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:Message-Id:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EBVwjvmX7hsjDlEGdW/9pG0sTiqiQEZ08etoG9T/N9k=; b=X2fr6HqIfPykzh
	V14SL7l5tiqfv8qmxeAFOYtEE7Ix8Ko8Y0vCQb2d2R1fcv7k7Pw2oLrKxCYuqOUVgUsJMfrYzpn97
	/+lTWlVmjfRzeRzygBFJPzTG0Kl9n784nzGUzK3wour7ym8aPg92YQ9oKYialyzNONrGqCAnsrr2l
	e0FOYFZ/xur4p/dJQgiqjCaFMJaESnznu+peE7w+Jqhge8vA++l5NNMuUCFXC8n3lN1Xz8FtMj90M
	iY/18mXP1pl4xqO+cQXQlnsaklRiE2n2rVeX9bQIdtXsD8vSaILTKtnnXxF/iZ5E++uEBYxAzKvJe
	djs/XHWrjyQ0p4uRH+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6fQ-00BO1d-Qg; Tue, 13 Sep 2022 14:13:37 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6cO-00BLLa-KA
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 14:10:30 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 613B0320083A;
	Tue, 13 Sep 2022 10:10:21 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute4.internal (MEProxy); Tue, 13 Sep 2022 10:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1663078220; x=1663164620; bh=QhEV/7XGHmAwPbGnb00dXP+AbwUjSJ8L2UO
	qveXOffY=; b=p1GKDnzgV87y+ki1jEuIIceBOosrIMRJlMfVOQboYFL5sOKcndU
	+1UnNnfkvxfldLfTOSAhQeyJqeOXjN5SZeQwgOE24RZIDn4S/QdCI7FFXQxKnq5O
	ff8k7fPhaGidOb9DEPeTaCWoJoP11g684qe4zxK0++umkX+bPf1Lp8mFad28MQIw
	v8pFB9PSyUpgjA3LCE6+6JujTrV++iWToU08oJTxn6TmBtFDUrHa6hxkDOEfo9Ao
	4KlaPzVseJc6s7LB5jA+hgh+4AvuHQONVhtqIDo8TwgOMgSbzYCYWmTk5qJpliSc
	8jjWztFOxR9dGUtOqPT2pYp0uLh+zBIkU7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663078220; x=
	1663164620; bh=QhEV/7XGHmAwPbGnb00dXP+AbwUjSJ8L2UOqveXOffY=; b=o
	cr613XYOWwWIo+RJkx1oGpDONRpneIQv9qgJaZLItlRkeWOWb2HCxKZI3fgryWwY
	BuSMfc0pKSsNv/k8DpQX46HK2UDoHzzN0au/pmPAJdtWWtz8CNKCIFCq6iV6EbfP
	SaQmTNp6mjP0B/t1OoxhBKpnmR4Ie3dlcfITqvGAq5GHlX4WyAkd4BtWjCrk74hA
	VT3Cv0JJNzEtMaVDDvh2OQysouOZLM+TWqXfN7yFzG6pjER9jYBa2l82bTh4BSRT
	YyMjPGioc8GRAxfvsUig21lC4IYzGaYLePpD/DiOCqRpTNNtsNJQhu/NPrasIbq3
	18ly/szOEi0K8NyWcYfvA==
X-ME-Sender: <xms:TI8gY7uexDV_ENlmZQcnCGUsyCkJbY6dcx0mO-gz4RNXIGLx3MzmUg>
    <xme:TI8gY8ezrVGJ5S1VKLz11ORZfGK8-9KXZ6PEfxVvg9Ld9DQnzzpVALzedn3pr1Dj4
    aQSLgf44IemLeZPVc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvvefutgesthdtre
    dtreertdenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfdvheehgeduue
    etfeevjedtveelvdelhfeuhffffffgheevgeffgeeluefhgfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TI8gY-ytTht_XBczdpw7bajHrYGByLtDSszl1SfQU-HtRVhb74WKuA>
    <xmx:TI8gY6OBNZPoJEynCJdw0qudUSBj87rN-0JsjhdVevNyp7Oqk3PFzA>
    <xmx:TI8gY79oyNgOBm7iCw0xuS9H-74EpwXFhXv2AhC9hXwP_lqeYisUwQ>
    <xmx:TI8gY9IuSuwxKShopRJsfZtVC1P27MjxfH0ErT0JqPQN-TNJFq74AA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48DAE36A0073; Tue, 13 Sep 2022 10:10:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-929-g09f3e68182-fm-20220908.004-g09f3e681
Mime-Version: 1.0
Message-Id: <9e1d3ba6-48ac-4a97-8b65-87e395898c2a@www.fastmail.com>
Date: Tue, 13 Sep 2022 15:09:59 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: iommu@lists.linux.dev
Cc: kvm@vger.kernel.org, ath11k@lists.infradead.org, kvalo@kernel.org,
 dwmw2@infradead.org
Subject: ath11k VFIO MSI issue with DMAR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_071028_953292_672A3267 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi all,

I was trying to do PCIe passthrough for a QCA6390 wireless card.
However I constantly get:

[ 230.587950] DMAR: DRHD: handling fault status reg 2
[ 230.587860] DMAR: [INTR-REMAP] Request device [0x00:0x01] fault index 0xa00 [fault reason 0x25] Blocked a compatibility format interrupt request

Error on host kernel.

Did a little bit investigation, I found that ath11k hardware is not following
MSI address and data programmed by PCI config space. It maintains MSI address
and data in it's own internal registers (programmed in 
ath11k_ce_srng_msi_ring_params_setup and ath11k_dp_srng_msi_setup).

It means when signalling MSI IRQ, it won't write to the doorbell that expected by
host hardware (in this case, Intel IOMMU DHRD's doorbell for IRQ remapping) but
the doorbell that VFIO made up for guest.

I came up with a simple workaround on host kernel that just handle DRHD 0x25 fault
and deliver MSI to guest according to fault address and data.

So I've got a couple of questions about moving forward:
1. Is this hardware behaviour a violation of PCIe spec?
2. Is it expected for IOMMU to handle those ill-formed MSI requests? If not is
it possible to get this workaround upstreamed?
3. For Qualcomm guys, is it possible to fix this behaviour in ath11k driver or firmware?

Thanks

- Jiaxun

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
