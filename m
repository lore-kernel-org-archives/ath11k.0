Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E98C77B7C
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLS5tsrtIFZT+h+ED9gLnyZMYAux23uUQEFxh3I3pa8=; b=MHZucAGklrIed7
	kzuL+WiosCKx+w/+qWQjOf+5yaE0LBg6+cEQook5X3IbMXKu9ixmY8PwMIoj89WBcjH0/KzD0Aelz
	RoTIFSdmTWbIQxlhPj3zNQQCSffnkQaXe00jXTtWIz63mh1CdXHKWmjaLwc9H69Lf3v9Thz/CnvNl
	/ItWW3eEKvDGgyxI28afC59cDs7awNR/yh+4yvu7QKkjikqo7UjnzXJ7EgzRz0NeDCT4dbR76pXIe
	APChjB3EFO5IfXpS9qkyI8pc/S4KeTll3jZDzvfptdAgXG9fAhNCeGKInTaEgy+aAGUBvtF/eKgJA
	NLwbrx7KBSWRa0aoKzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8i8-005eAL-0e;
	Wed, 19 Apr 2023 14:23:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8i5-005e7L-15
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 14:23:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D519463B39;
	Wed, 19 Apr 2023 14:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DA8C433EF;
	Wed, 19 Apr 2023 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914180;
	bh=HAbRNwbjEx5nsjR3xWymJ4ejFkh2h+WBog4VXc/zlk8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r56CNY2wZUag8AyEI2WxriXna9jDYMdsjsmggvj1wkLPDK7hCStdOmJj/5JQoU5x/
	 +bIwC14g0/lHyedxKlJ79m8ViBgk5m419OTTrntCUM/Ujn5ITsuUPNDuKnvUzSj4up
	 pywirmyPCtX9aD1qeNiR0SyU4IdnCY/f7T3sY3QrU3QEhqdlAAUb34+x4Fq6akpvJ2
	 QHtv/d/waHm5JN7WodU3WjRxPJ0Val7ln0Gn4qpBjVaDPUjLsFu62+08AgOu/vqrdJ
	 G8p/+pnLyKoO8lDzx6Er4KEX5SRCpHDcaTFaBbWcmdzfFou3D/kGTM7p1SF0tpJCw4
	 mwP/rKel4Wg/w==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath11k: fix double free of peer rx_tid during
 reo
 cmd failure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230403182420.23375-2-quic_hprem@quicinc.com>
References: <20230403182420.23375-2-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>,
 Sathishkumar Muruganandam <quic_murugana@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168191417708.18451.17418807268052315291.kvalo@kernel.org>
Date: Wed, 19 Apr 2023 14:22:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072301_426394_FD4FF0D3 
X-CRM114-Status: GOOD (  11.30  )
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

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> Peer rx_tid is locally copied thrice during peer_rx_tid_cleanup to
> send REO_CMD_UPDATE_RX_QUEUE followed by REO_CMD_FLUSH_CACHE to flush
> all aged REO descriptors from HW cache.
> 
> When sending REO_CMD_FLUSH_CACHE fails, we do dma unmap of already
> mapped rx_tid->vaddr and free it. This is not checked during
> reo_cmd_list_cleanup() and dp_reo_cmd_free() before trying to free and
> unmap again.
> 
> Fix this by setting rx_tid->vaddr NULL in rx tid delete and also
> wherever freeing it to check in reo_cmd_list_cleanup() and
> reo_cmd_free() before trying to free again.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

93a91f40c25c wifi: ath11k: fix double free of peer rx_tid during reo cmd failure
a8ae833657a4 wifi: ath11k: Prevent REO cmd failures
20487cc3ff36 wifi: ath11k: add peer mac information in failure cases

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230403182420.23375-2-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
