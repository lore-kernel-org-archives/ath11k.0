Return-Path: <SRS0=Iy3B=GI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E451CC433DB
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A209022573
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A209022573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzqKfFo5j21MRSxkoHo/gAs7YyliotqaKV0GeYp1nmo=; b=CPiICcvsddGp70WOt1r/GFdtDo
	SZG7j15FTcm5HhnVl/bHsLvq+7Rtd1dRvrgo7hByli6DXMzFBJst4V3qHDGlp24mb/h4n1+JAchpc
	nWNdnhXtjmw6MchGuWOEolV8IdnoCEbZ8Kxj5Eh7RzdDdKmm7j6L5eSVa6UBMLcZTqbFJAJrJfIwa
	ZRKW5AiZA36etI1MWpJa6o94P0GNyXqkguIDYQFagqP4eI6kEk4b/Yv5sQP2yLVVyYImEbGVSpa1L
	WfZO31kD7JtH1x4X2tRntgledOa4/7ehC3abWkuXoAVbg06dwhtrBmWwO1Epa8x1WmUdgKUsQ/JC0
	DzTxMOZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwchp-0008Q0-RV; Tue, 05 Jan 2021 03:08:21 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwchK-0007yb-4b
 for ath11k@lists.infradead.org; Tue, 05 Jan 2021 03:07:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609816071; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E5vRSnPU8vgOjh0v7w/gEpMKWkN8/JBU7M/qzImgpwg=;
 b=cekGoxiCBrw5j9tblS4FRuWmaM8q9w0xKBz0+yZk5qMAdEBaAJu1PRQacFfoJFluN6jxFpnN
 du0VF/vxYnW4IZGgl73jIDX0ERADcS32tOBM+sZQ7qv6IcJ2hUGqTugENauIuiHgmegDCzw1
 Hfoy7Wf6fUQscB9/BKRF5p01H34=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ff3d7feb100ecf37a7b632f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 03:07:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DDF93C433C6; Tue,  5 Jan 2021 03:07:41 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3342DC433ED;
 Tue,  5 Jan 2021 03:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3342DC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Subject: [PATCH v3 0/2] mac80211: set NSS correct for supported HE-MCS and NSS
 set
Date: Tue,  5 Jan 2021 11:08:38 +0800
Message-Id: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_220751_770883_B09D6321 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The NSS number should be the intersection of peer and own capbility.

v3: added "mac80211: remove NSS number of 160MHz if not support 160MHz for HE"

v2: fix build warning

Wen Gong (2):
  mac80211: remove NSS number of 160MHz if not support 160MHz for HE
  mac80211: do intersection with he mcs and nss set of peer and own

 net/mac80211/he.c          | 94 ++++++++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h |  5 ++
 net/mac80211/vht.c         |  9 +++-
 3 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
