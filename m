Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49AC433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wjkmdfpf4X3ODC+8P1LbHhdP45Hq9EzTJQPD6x/lep0=; b=DREdVTBOayHZ3B
	N6YIP5faSKC9qElJYNNUG3A1z8m5yAN+DSAYZrgCf0qyNoZF0WiWqy3g3cc2fgviN5jhwXgMyxwwL
	VyHJvgduaUdTyfRs4wcO8SoxKLBWnF/Klyf0dAx4Lbq5pN0xCb1DyUqoqibVC/ucvTIMgpJ0A96Vf
	0gXfbcnK6rcYLhabxVuQg1znJRqOLCEXyQODqJM9T7sqv4IavtyAlvI41nlhpBSkk14FU16/iOi9K
	J67zWncX3uLeZ4eCzW9yHZOzUodIeNYvnP7jLlig3E1ncguM9REVwNUBYsYa/zA/4ESUn6oEBDE7/
	XIaeao5Mg6wXXuY016zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvku-005Mvo-EL; Wed, 24 Nov 2021 17:08:24 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvki-005Ms1-1e
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 17:08:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637773697; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=SsOaG4KKtTF23YA9l/Oy/286NVV7+qx2t9Mwy5ADN0k=;
 b=I2uA0hCBuwJNc8HxemIgLX2n9J+OwdHQtp81k+M+IwAE4XEtuhlbey3mZ1xsOxtFk15xGD0i
 V79qPH6LGV9j36S1H3EEIFeSFFBC81HBC3dova6AHS8CuEYN8vIhBz2QtbSHVX1bceU/4+O/
 f4ZV1zGC8VyQuyGcvHhUUD4TgKY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619e7167db3ac5552a3833b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 17:07:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1EA7C4361B; Wed, 24 Nov 2021 17:07:51 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F8F1C43616;
 Wed, 24 Nov 2021 17:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2F8F1C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix spelling mistake "detetction" -> "detection"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211123090431.165103-1-colin.i.king@gmail.com>
References: <20211123090431.165103-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@googlemail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163777366728.11557.16795024043918994213.kvalo@codeaurora.org>
Date: Wed, 24 Nov 2021 17:07:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_090817_317071_80F851F1 
X-CRM114-Status: UNSURE (   6.35  )
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

Colin Ian King <colin.i.king@googlemail.com> wrote:

> There is a spelling mistake in an ath11k_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c27506cc7733 ath11k: Fix spelling mistake "detetction" -> "detection"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211123090431.165103-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
