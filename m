Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7802C7EE23
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhNoeTkuLa0pJWZz5wb6sR/ogC0NMJQV5ncNAJ20O3M=; b=N4h9uY3v2jeIR/
	/kC1SoeVIw+bmc2anN5AQqoWoPyduI3KSi1UBWmtSWn+jMSux31eBtBgIgeC62Lq6qxuqbE+Gg1Eg
	76LS75A72DhEE2l+oN8IAF530PNwZ6nZ+H5NXXO2xrjfoluFdw+34D4cyANNet8MUqGhrl/bdlJOa
	bFzzvaiJe1oe/zfZOFazTPqmCdM9fiGZOKyD5Arl+ujEukCUL2hCrflUCZskL5wq2Kgg+HPA2n7+l
	peYZQAIrgaKkDfPzhf70OVLjjnfigh8O/FtRQz1l7gnrNxqxA1unDobdJQ30dyM0vjGl1eQl51j8o
	dzGdFEVKn9vuFETHSQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fig-0035ex-0K;
	Thu, 01 Jun 2023 10:39:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fic-0035eW-2f
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 10:39:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3725561984;
	Thu,  1 Jun 2023 10:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8006BC433EF;
	Thu,  1 Jun 2023 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685615985;
	bh=XlMDOWiwV7JBxac9ef6jjtVZODT4kRA0z7MFn4Sq78M=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hOD0Vl0q8jYUUWUMrJmYcK/s04TGD0CONGXeRQOcAhSTbnmbG1xEc1JDOPnGZZelh
	 IF15cH6AQ48cvdwbcbjL4KBfeB0BOmpqV6UMb2BXgCfI1fUmzWQ9wnOGamCYBS3s6J
	 u/qNaoR2LybbgRA8+r4fTC0XIF8n1V4XDlaL0DxUFU88ySHi08ktMNCMNYDkeyXCNh
	 kxIM0aPJypug2xrsGa1bATVOqKbOS6FZTQxOAUW43zZ9F/4j8Ms+p6AaUrCDV2AmDz
	 JKhwmDyTWccAtGzzV9li5v3bn5R/QK1QfrUBFPHgw08Y8BmP6nOf8iY0JU4+1YEda2
	 7bX9rFr+vFJ0Q==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: update proper pdev/vdev id for testmode
 command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230601051907.13679-1-quic_rajkbhag@quicinc.com>
References: <20230601051907.13679-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168561597885.12237.8170515167122761875.kvalo@kernel.org>
Date: Thu,  1 Jun 2023 10:39:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_033946_927221_DF293486 
X-CRM114-Status: UNSURE (   9.65  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> 
> User can extend test mode command support to set vdev and pdev params
> for debug purpose at run time by sending vdev/pdev param set command
> through the testmode command interface.
> 
> Fill the proper pdev/vdev id in driver since, pdev/vdev id details may
> not be available at user space. It will make sure that the proper
> vdev/pdev ids are sent to firmware.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/testmode.c:320
error: drivers/net/wireless/ath/ath11k/testmode.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230601051907.13679-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
