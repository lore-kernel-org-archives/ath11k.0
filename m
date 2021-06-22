Return-Path: <SRS0=ib+T=LQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADB2C2B9F4
	for <ath11k@archiver.kernel.org>; Tue, 22 Jun 2021 15:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB06600D1
	for <ath11k@archiver.kernel.org>; Tue, 22 Jun 2021 15:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB06600D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acECrwTVRlX3gRK42I5IBOpqmGJ6JKc4dNRzoQSGHwE=; b=A/hmN45EVJVMLR
	eF+DrsLBpJ21+KD6nFZSMWlIj4tFoNXKZoBOdddg9Hc5c3FQI1d1hhga2OHa7PBTa0sYj2gx0XNVe
	A1a8ku6iYoHtKKEaX+j+P00Yp3f3f1lGr8bIxi/z1k/+bGWQvCjXIQSyhDTi1X75HJzx6HqvKo6JJ
	TwaAmG2Zu6rAPNxfXNEBfV7yhAWVZhNGJWstm3i1WMoU6Nj54ymND6ZQebvuflJiSan+wvnAA9N7H
	LTXX6iT+hGGS3mXQ++7v90EPvox091isCkKlp6Rma9TDjdvHBGH/xM9L5LX3pK8VJR/pnaan3/pt4
	fHVM2WrVAcTfC02/yfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviKY-007hOU-KO; Tue, 22 Jun 2021 15:28:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviKN-007hIZ-Or
 for ath11k@lists.infradead.org; Tue, 22 Jun 2021 15:28:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624375727; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=2MYYVM3Za+tUpGkmkno2Ut0CaeSuF4HzPOvfT7sLpL8=;
 b=v9H+JI+jbLeaUtelsKYmjIfsd95ZS5wGCYNDvGgOw//BQme++8oHVinZvtZBTKl1qlgfZJNN
 AH2M4PciDC9v4PawxfVdYeBBzspRF0qpWiSMoYyHBwg6mG9o3bQWY+POSxbSd9hnfcv1BTht
 QDt26EUJcPPlknDEHefawb/bET0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d2018ebcc24d859bbc03d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 15:28:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4EABCC43460; Tue, 22 Jun 2021 15:28:14 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 97538C4338A;
 Tue, 22 Jun 2021 15:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97538C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Avoid memcpy() over-reading of he_cap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210616195410.1232119-1-keescook@chromium.org>
References: <20210616195410.1232119-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: netdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210622152814.4EABCC43460@smtp.codeaurora.org>
Date: Tue, 22 Jun 2021 15:28:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082847_992514_7FE643B9 
X-CRM114-Status: UNSURE (   8.54  )
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

Kees Cook <keescook@chromium.org> wrote:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring array fields.
> 
> Since peer_he_cap_{mac,phy}info and he_cap_elem.{mac,phy}_cap_info are not
> the same sizes, memcpy() was reading beyond field boundaries. Instead,
> correctly cap the copy length and pad out any difference in size
> (peer_he_cap_macinfo is 8 bytes whereas mac_cap_info is 6, and
> peer_he_cap_phyinfo is 12 bytes whereas phy_cap_info is 11).
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c8bcd82a4efd ath11k: Avoid memcpy() over-reading of he_cap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210616195410.1232119-1-keescook@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
