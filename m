Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5BBC4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:39:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953EE23884
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 953EE23884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5vPmmQODKBGF0FbIO32TqiGQwwd4mkPR0X2iBqtl2E=; b=eL5QNwKm8A+6k6OQUxrVk43NE
	T1EUWFmW5IgsDY1QWttL5ZMN279FHWr+RC5K45tGFBpCuGTRmYACec7DNC8JEPq8JEOBJcRf7XKcm
	c5w9NUFzRzgA7yJ55tvOdbzwgUh9d++Nhu7mK9tRA/tuRYdV16MtrPN8ou2vEaU/aAHvLtrCSW7UA
	O159LsBgSFqqrmipG1SatpQOIjj1ZIfOeExVwGvuKOMhv8w4SG2ynezQp2Ico43b/wiO4qbASFkkO
	lLrrnC4CRvW6667XToPNeJW4oAf6HtCrZxPMUoQJY2t02DxXN4U6Foi24xmA8bH6Ni0mGSREcZmKR
	zBphmV9lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpmwY-0000ze-Ey; Thu, 17 Dec 2020 06:39:18 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpmwU-0000zA-QN
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 06:39:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187155; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=v9dVYGbG3Dl98V1iYFZEWhPG3mgZAntKN97hbxxOUWg=;
 b=qaKTsNsPDcWbo5InTtnLNFP+gIRJMXTBuyLchWWedo3CKc2Exbh8kJALmmzG2i3hjeCAhCr8
 XoyvFrhm/kSRqOyRAHcFFveLDlclDqTGpifmWNUVwieSNCBY+Imtz7iSIteyRWiPvNC+ukkH
 YqvFWJSnHsAk1LqAq7Ay8FNvW0I=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fdafd0993a3d2b1cd867990 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:39:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 123F8C43461; Thu, 17 Dec 2020 06:39:05 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 262F3C433CA;
 Thu, 17 Dec 2020 06:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 262F3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ath11k: add missing null check on allocated skb
References: <20201214232417.84556-1-colin.king@canonical.com>
 <20201217063600.E5DB2C43461@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 08:39:00 +0200
In-Reply-To: <20201217063600.E5DB2C43461@smtp.codeaurora.org> (Kalle Valo's
 message of "Thu, 17 Dec 2020 06:36:00 +0000 (UTC)")
Message-ID: <87ft45uebf.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_013916_092873_6315381D 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Colin King <colin.king@canonical.com> wrote:
>
>> Currently the null check on a newly allocated skb is missing and
>> this can lead to a null pointer dereference is the allocation fails.
>> Fix this by adding a null check and returning -ENOMEM.
>> 
>> Addresses-Coverity: ("Dereference null return")
>> Fixes: 43ed15e1ee01 ("ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-current branch of ath.git, thanks.
>
> c86a36a621f2 ath11k: add missing null check on allocated skb

I did a mistake and that commit id will change, so please disregard
this. There will be a new mail soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
