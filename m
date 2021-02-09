Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4D7C433E0
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E3364DE8
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E3364DE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JgZ5UI8j43XopPl5KDcQL47ahdxl5ThmX7feR7HT2P8=; b=cANCFxU4K4E+hG9oOTOdcPYgd
	+uYqT0kkH3S7NN411V2B558ihPHeQs+qI3LyDUcOs4tItpg0ZqMvthhh8NAG1zAF+GQSchC1fGr2z
	9lyIjyaJpeXbh2no8Pwhf2fcIkzfCx3SOA/Ue2s7/+Z7AqAI/WZepiy1E6FujVL9E+BvXAfe899WQ
	vJWLPz/l7Wx0CrOdeqyi1cdOhdPDAGf+dptdfM9BqFystz12L46rjEQdOjoJR2Jgu16eZsJr7bnru
	PFjhn+n9tbFImHg1XsBQM3+YW+BTBY32HhdDC24G6g1OpezTpUQB+twBiheLUJUz0GA4nIzr7sREX
	UHEVbkARA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9NN6-0002fS-04; Tue, 09 Feb 2021 07:23:40 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9NN1-0002a4-OM
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 07:23:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612855417; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=j2+StROZGUMJsP5pAcxNrVcOj0D6TTCbfW3sICHkfZw=;
 b=iGQCt5se0XkhL9zQAmJLJmOp0dkIteDztFYd+MrXDv1xY2TLCctui6vWrWmas/Njfcn0IyQO
 sGdflrgBJmewilTQm7RKhLx3XesL3CDv+A51I9x3VRjbtRVd/SSIgXAUd5CXZ/naHSPfWufR
 PvXfr3kIjfVPoi3uOpmWhfm+toc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6022386881f6c45dceb93ef9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 07:23:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F05ABC43461; Tue,  9 Feb 2021 07:23:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E2F1C433C6;
 Tue,  9 Feb 2021 07:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E2F1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Update tx descriptor search index properly
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1612410960-9120-1-git-send-email-periyasa@codeaurora.org>
References: <1612410960-9120-1-git-send-email-periyasa@codeaurora.org>
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210209072319.F05ABC43461@smtp.codeaurora.org>
Date: Tue,  9 Feb 2021 07:23:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_022337_895865_4AFFBA91 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Tx descriptor search index field should be updated with hw peer id
> and not by AST Hash as per the HW/FW recommendation. Incorrect search
> index causes throughput degradation in all scenario for all the
> platforms. so updated the search index field with hw peer id, which
> is a common change applicable for all the platforms. Also no need of these
> configuration for non station type. seen 10% throughput increase in WDS
> traffic with this change.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4b965be536ee ath11k: Update tx descriptor search index properly

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1612410960-9120-1-git-send-email-periyasa@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
