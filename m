Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D29C7EE43
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oa7oOnp7p862H7F5pqbrooZa+dfSPXmBqRwJdQ105CU=; b=w9T6WLqdfvjCge
	esSzHiZLN/z+0aTQx5fGchH7AGs50F82Nl4huJPlJQW4xdVVBO2RDCDyvJkrBEp6EA8T3TNdzcnq4
	5brPcXQ8pcYjG2HyLN2swYoyqhjpl4CwVoamGvcmOgs2x50yxmx4pngVROdpzJPb9KzSZCNWjnXms
	MRu4kqqAMj+orI4sK8KtO6IZSY6NUiLhheTOJmBobn+OBdHL2V2lMHIIvLOOAu0vRktCAo6+OenpY
	2LixG24OnyzFN9tYHk7MBe2askeuGD25hK4I7BiWAlKM6iMmL1sYxkh0LrrRPV/OXcndZ5noYzsVS
	3ptBxyYVT73M29ATg5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bGL-00CzdP-22;
	Fri, 09 Jun 2023 12:30:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bGG-00Czc3-25
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 12:30:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09D7A6104F;
	Fri,  9 Jun 2023 12:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD73C433D2;
	Fri,  9 Jun 2023 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686313835;
	bh=fHSDsbEM3pf6iExg+U/gM7Vi6dgz9Oowtp7sAe41Cmk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=unDjQkK799pa3m5ecnhBKjznXRPk39B7Qe6kDqXvuxyrgsgWafMZaS8okOnurcu8g
	 TkcgjM4BPS6KYMHDXRoy1rl1CEl7kvpNZHY1W0QJXwcDWLNLPvdEJvvJubvSapIY7N
	 BuYkLbi7D+oNhnSWtcIWH9jxiDb83QggGD27DY/4yJFdr7eukg2//xTc2ZQrLxs61F
	 t5TPKnQP8kSy4M08Tj2oz3Q4RN79+qJBwz67FOWMO/+nmPxZPjrX6cybsZfMG1gFPA
	 XnxNsJY7rAY7wLwT7fPa479NX5MYbghnvf/laVdpH8xk6BuEbHfvF532tUiGW+fq7R
	 WmKKBcN/CUEXA==
MIME-Version: 1.0
Subject: Re: [PATCH v3] wifi: ath11k: update proper pdev/vdev id for testmode
 command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230601143214.13006-1-quic_rajkbhag@quicinc.com>
References: <20230601143214.13006-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631382682.10496.11328415965005011674.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 12:30:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_053038_657629_8C342881 
X-CRM114-Status: UNSURE (   8.34  )
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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

37fdb33c87c2 wifi: ath11k: update proper pdev/vdev id for testmode command

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230601143214.13006-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
