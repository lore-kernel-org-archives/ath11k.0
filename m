Return-Path: <SRS0=wXcr=JT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464EEC433B4
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:04:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E127C61404
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E127C61404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C21n4Tm7c1IBzDTZVnZdGJdw2uxDqodxNtEysA7Xakw=; b=Sv+E5CX3rmQ+sEis2FDAWueoX
	NWdY2ZXsaUr+DVYRdd5TVCbWYorWQ0h+7mnzeJKofAwvlMFTSPLlyQP15BO5n/wG8spCTGK9+8wX3
	sCrjsvnrLOaUXBC550so/r1krDzM54v1j7j/+N8XqqYpgP+S2qKRqAX3oQLLUaQ9U1IsNrgBByiZM
	/7OcuRrrzeaORVGoUiVA6L3oNcHcMUKDzCzUh4fYCfcRK2XNMW0+NhaByVH2VYSIqyt7FR5jXK2GP
	XkBIGgLCpqJIgCfdNT3vHOh1wbHfR6KObjfK4nlGmJeHNrEN936HTMPR8dTk2XyGEkcZKoUOWpPyq
	ydmCgeVrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZw4-00Gqdx-2a; Thu, 22 Apr 2021 14:04:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZw2-00Gqdp-HH
 for ath11k@desiato.infradead.org; Thu, 22 Apr 2021 14:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Message-Id:Cc:To:References:
 In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=4HMCjdtvHaTSyjFKUDRAhNbN/Lc1AjfSDQkLeUEgxs4=; b=d1I0d+o3+jhRHJOWj2VImHl13P
 ggrn/4v40Xj5Z/CeNOittdZqVWJbTgH+lPhQ4avpQzI5lMWIoyL8kAx2KrdtL8oouZTT1N5OhimsK
 Y2V+2OwCAYk1nViCafxG8pfEMei9Vbv8acEB5rFcYdyodF5Cdmp82i3yNZZcmfpl6Pt0GW9pqeDy6
 H2FZlhKWTWoX01tOvAfVak9giaodJOrakF7t5dwkJqgdnHBRVhUmzLVnUhqR3zPSaUmo9irxieyt2
 XhFkf87JUbzLcmRN7Q/HSXG8l2EZ9ipO63Todb823rsGvt9uhwQmNBmXACMpskWUULmm196yMOt5A
 Se4vQ5hw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZvv-00Dk4P-AQ
 for ath11k@lists.infradead.org; Thu, 22 Apr 2021 14:04:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619100239; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=4HMCjdtvHaTSyjFKUDRAhNbN/Lc1AjfSDQkLeUEgxs4=;
 b=Cl+kFTxLlXYQGo3RTdi1AOuYnohfnfesAeFza0cFyqiMn8kwLpRAQf0z6OsBPAr5Gzqb2fwB
 J7OOCi4lmHj3nvInnLQ+xVK1VwVVgCDcoDq1/Rhv7zEjyAO5447X2ir1ieXY/zVmA2XwsCcH
 8pBlzeXWUZNTAUE4td4ZgJIQcHQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6081823bc39407c327093328 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 14:03:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0B52C43460; Thu, 22 Apr 2021 14:03:38 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 35198C433F1;
 Thu, 22 Apr 2021 14:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35198C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: qmi: Fix spelling mistake "requeqst" ->
 "request"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210316091924.15627-1-colin.king@canonical.com>
References: <20210316091924.15627-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210422140338.D0B52C43460@smtp.codeaurora.org>
Date: Thu, 22 Apr 2021 14:03:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_070359_999358_2C5E5501 
X-CRM114-Status: UNSURE (   5.97  )
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

Colin King <colin.king@canonical.com> wrote:

> There is a spelling mistake in an ath11k_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6dc89f070d28 ath11k: qmi: Fix spelling mistake "requeqst" -> "request"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210316091924.15627-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
