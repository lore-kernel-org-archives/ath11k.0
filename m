Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159EC27C52
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY/JrSJiN+EVGJ3mDz6X7ujuy2EwktQ3NKEFuPgKGV8=; b=bsrBXroyCwkKIsh9u3k5RCOXE6
	K4jznCt4KqlLWxGfynIXQjaVwvc9o8qS8gM7yWaZpsLuM1xu4K3bLwB/NgB+t5yr/tuNtBGxi7MzO
	ld1kg9gekqy4DQGKBSgCcffO3XrNdKVr0M1vzu0UYMqvuGMBjMYriEsTck81ie4kEhQGtx8WD0BX5
	O5nqAWtNBwvhKpFTNtVNMP3lEToHBU7izYCj3xIOsqBUARyPgPk+8C9jcYz+Slq5cFAUm/2YxuCew
	YVQzEFTMUOkUcfrzEeCIkngCscrDSLFGXbAFPZBOZSqqPmjTyr4jHUH21z7r834685ehvP9/ta3ca
	KniznMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOyK-00000001ZmN-1U3H;
	Tue, 04 Jun 2024 07:52:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOyH-00000001Zlc-33uo
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 07:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1AD9610A2;
	Tue,  4 Jun 2024 07:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ABCC2BBFC;
	Tue,  4 Jun 2024 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487560;
	bh=2lGmMm8DSovfPgFh9pmoXTxiS0kIvkJg7OEmsPbxWm8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gFPpeap3y2u6Pa3EELDASSiLnlXXCgEx5IwB4fS4sOu8I5nRL4ghVJrPbmliogtD3
	 yJzxnZiNMSLT1PiEgHnpP03ChVxyJX8Doqn6UaIix9dX0TyT08ryEqybv6D8yJhjer
	 o94dHGgmBrCJEFhz6GQtY+LYlgJxRQ7pl5N9aafEQSTPs4UL+llKfkNzKL5fIZuk9/
	 E9ZvdxCV7+ItcBDOXLEJg1gptb48a2If+C6gujxemlCjTiujoY5QQYW5NftOFX2vT6
	 +WFL5axyNFwJZ4X7SvBXmWi/KU3s8sF2xUvMxSBbuSEaMYa5C6QHuOT1zgor0j7140
	 f/2hYfdgvaFCw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Add firmware coredump collection support
References: <20240531064019.3687581-1-quic_miaoqing@quicinc.com>
	<75f1a3ae-c1ca-46a6-b38f-b0eb1fa3bdb2@quicinc.com>
Date: Tue, 04 Jun 2024 10:52:37 +0300
In-Reply-To: <75f1a3ae-c1ca-46a6-b38f-b0eb1fa3bdb2@quicinc.com> (Jeff
	Johnson's message of "Mon, 3 Jun 2024 15:59:38 -0700")
Message-ID: <87sextta9m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_005241_854040_A7B6E7AC 
X-CRM114-Status: GOOD (  10.27  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/30/2024 11:40 PM, Miaoqing Pan wrote:
>> In case of firmware assert snapshot of firmware memory is essential for
>> debugging. Add firmware coredump collection support for PCI bus.
>> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
>> format and also pack various memory shared during QMI phase in separate
>> TLVs.  Add necessary header and share the dumps to user space using dev
>> coredump framework. Coredump collection is disabled by default and can
>> be enabled using menuconfig. Dump collected for a radio is 55 MB
>> approximately.
>> 
>> The changeset is mostly copied from:
>> https://lore.kernel.org/all/20240325183414.4016663-1-quic_ssreeela@quicinc.com/.
>> 
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> 
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> Kalle, I don't have hardware to validate this, so hope you can do so.

Yeah, I have a WCN6855 test box so I can run some tests. Thanks for letting me know.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

