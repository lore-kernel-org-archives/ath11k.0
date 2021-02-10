Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C6C433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0698C60231
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0698C60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MO8k3obr2biaDxR0Awweab51wfdiv8RqNlqH/5vmnt0=; b=rxQLj6JikJUKT8GNqkzcnjHjeJ
	CkCzPeUx+qc7+DL/LFj2vSZI75Xx5og1DqYHWypDCFUsDgCSlZuDUZirRRi6vZWWjIOk6ubfHc9H1
	p3p+hItoOUgIGp0Z62WH7ze/Lcm1MeAEwO2PHlUrrIIspVTsJ8Ns5FOUVbyd1AkOtyt2OIGQrz7eX
	kRiAMX6YvTBt5tMY2xQTalBVTlcdTdStWzuOtcaISQ8+RmeXxnJks8CenvS/Y+EnEpg80HTiU1UFd
	8tuN6zzsPmfVn2i3VbMx4IwSk0e4DBAZKuhu2ru7wrjMJkxuan3XWo4TMmrxTUgFRo1hn4KrdkZHU
	j+q9aMng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kox-00055W-7E; Wed, 10 Feb 2021 08:25:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kou-000545-Aj
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:25:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id cv23so692798pjb.5
 for <ath11k@lists.infradead.org>; Wed, 10 Feb 2021 00:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g4mAxK84GVyyKetwRBgARd5k8KiBNnAsnToA/1zbXCg=;
 b=GLne2KwtyWUcLtsjoYrN2d+ZV3yyoA3ILAldzIyiYA8Z7waJFzoH7SNdpikNHbBVAy
 +PKuZ2LJBCfu0JtcPEJjYTz1KEuPLyTadRuVGRXE0dRv/ZiboPdinPnVC68WkXKDLV0M
 7CLvS8Hmt3mpG/urv/zMZP3vzNCuaDV4ypO9eMe2rvfy30KlSgZFqFR94Xx4i6+06V4Q
 m3hXLSTKNNdnf5rF5s2OI1OHxvT8G41ixRVOpkZgbOST8D7i7AHjT+kK5KKssvGtOlPD
 Wh3nOdDRhI1XTKZANfFNzMNQhyxyt9TXRgad4pua6Ovc8FF8sSptWfVEiM7L9pfSDZI6
 8OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g4mAxK84GVyyKetwRBgARd5k8KiBNnAsnToA/1zbXCg=;
 b=F3NUAHvhVJHasqFGx108rdKjgVsj9+E1LTd4NP0OkMyFFEiRTqG4o+X9I/astZmR8y
 42Z0fyzBdkum9t7Zmd5xXdZHmk7VAL0IA4WFjA015MQNcQkqaUVmqKERMdlkWaCLftXm
 INecI3RlwVckMgsz4Ar1rp0q2QD88Uig619x12n/vJfx6cFNF/CGrbZ5MFNMMMvhaPkA
 wx4rtzZ8vZjBy3Op3/gRV2GVbMqdQXwZW4eEF8EAuiekipL2OwqWiMpF0I8w5Y9pP7D1
 seVM5rdWcyoGEWsAeptuFZJam3yT3yb8QzfNoKbchZ55S2djBgYHirDd9YtVk/8IzQg9
 cGGg==
X-Gm-Message-State: AOAM533MCjcxcluEy92PrLJFkQyY763TtHEkJzVzPJ7O07bRVY09mYse
 VHawX5Ncx/JNu52YjDrx58Ln
X-Google-Smtp-Source: ABdhPJzhj439RRQshBLOOGPVaOfrmeeEbK3w7uF7K8DfGOTJ+v0iCH7vyeCfb1G1rhxshZxuv5OtPw==
X-Received: by 2002:a17:90b:e09:: with SMTP id
 ge9mr2016098pjb.173.1612945552492; 
 Wed, 10 Feb 2021 00:25:52 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.29])
 by smtp.gmail.com with ESMTPSA id r68sm1402963pfc.49.2021.02.10.00.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:25:51 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 0/1] MHI fix for v5.12
Date: Wed, 10 Feb 2021 13:55:37 +0530
Message-Id: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_032556_406882_0BDA0751 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: loic.poulain@linaro.org, jhugo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Greg,

At the last moment we noticed a regression which existed since last release.
Since we are very late for v5.11 rc, please consider merging this patch for
v5.12.

Thanks,
Mani

Loic Poulain (1):
  mhi: Fix double dma free

 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
