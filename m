Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BF1C433F5
	for <ath11k@archiver.kernel.org>; Sun, 22 May 2022 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RL7mEVYvaV1BK8CIQsiTny+Je3NaQCoycS/2vh8iLrw=; b=D1OUMM0/a/rkGL
	4IlBbDtDW8GVQDwJWgEzcXdySU6xJIFwz+B79Q1x3mJnp31zk+IPvTtWRH1UHr/CKmD7XnADZ+teU
	TfcWZJpDL1+9Uau+969IfmF/6s2gzxZS8GgQ8KZ9Yk5EOXad3axQjo073d3qP+p65c7fcX3uhJpRv
	Ykdb69/d7/Ph7oukpMRms0TaQiM01X3+WAoVJOx7iEJVm5GlE2VMvhxw4caDA8LtSqKBumsJZnQCk
	3czoCdIDTVSGV4df1/ffRwQc5pwUQpqAs7XiLa9oKREPzFK1Or0Mvhz5bcDnOm2ZyCGCKN7OVie4e
	AoKqYceEi/cIji3hWDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskjd-001KeS-KV; Sun, 22 May 2022 12:31:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskjb-001Kdm-6d
 for ath11k@lists.infradead.org; Sun, 22 May 2022 12:31:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C452BB80B05;
 Sun, 22 May 2022 12:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A221DC385AA;
 Sun, 22 May 2022 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653222656;
 bh=BYVDciy1MFj7bFAO0Jc9HGcx2iNA66NF58AjAeNr7pA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Cm5EzfPS8IR4k+5iuSwFBZXPSF+lkutXa/VARPsRhSTDoF0vhWVDhLLP2Es1E4wtB
 G6r76lXemWx+SZwu86MKepZUeFEDPqnigguZswSBUTdl+OksV7VoYd3Hgx7NbIdwDw
 niep+V9ypsv8WG7KDQOcAIho79es997P8phuDIf1E94pzt+LAmASYaNuSSTeCFJdgd
 YmkbgwoddSU8EIF9URMJDMiigiheMoN6U9A5lleHU65Z240a7lDlEKjE/Nvv07HVGX
 TzQUdLxmaQhg5cduJo0eeYQSh1OH6VQ+2mUUlmfNEqI0e91azBqJOO4D1AVKhsGniv
 wbjqLRhGPlt3A==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Init hw_params before setting up AHB resources
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220517055241.15885-1-quic_mpubbise@quicinc.com>
References: <20220517055241.15885-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165322265355.774.15991530710426373571.kvalo@kernel.org>
Date: Sun, 22 May 2022 12:30:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_053059_436923_4FA00D6E 
X-CRM114-Status: UNSURE (   9.56  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> As part of adding the support of WCN6750 to ath11k, bus_params
> were moved to hw_params and this regressed the initialization
> of WCN6750. By the time AHB resources are setup for WCN6750,
> hw_params will not be initialized and therefore initialization
> for WCN6750 will fail. This is applicable only for WCN6750,
> no other device is impacted.
> 
> Fix this by moving the initialization of hw_params before
> setting up AHB resources.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

bebcfd2534a6 ath11k: Init hw_params before setting up AHB resources

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220517055241.15885-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
