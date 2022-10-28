Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00959ECAAA1
	for <ath11k@archiver.kernel.org>; Fri, 28 Oct 2022 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQ2ri6bICf9oJi5YujjR/69JMwtr5DGzZlQDkzW/E5s=; b=V8s59U94DzA4d4
	yJtN8xTLEX6hW21FIvmW+OpjiCkT1gw66AqRJDw9WUBkjgoJJQInnmR9TDijOZBx7pMm2XI1sX2XQ
	fKjHWm6oGYFS8J3CHvVpV5UpH0KRZCuMQmFzYa1zqpSbbaMwm4p6/iSYwmNlw5T+2h6O7t0Sqba/d
	4R3N7XrWuUoAsWrzsa0efcgLp4jUKIlgHIZeZTRi+eazh5Om8pwQDKV/4WfOwtj+oy0OcumOZZUpk
	2KmN1x3JCssx1AgXBfbkB4UI0dcJLQF0N2awj6gBSgqsAeq7agSHX6PgQ18vxQangtxyXKDySiVzD
	WbC+fPANMxmKaGLeW8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPMy-00HJwZ-9G; Fri, 28 Oct 2022 13:25:56 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPMv-00HJvr-Hk
	for ath11k@lists.infradead.org; Fri, 28 Oct 2022 13:25:54 +0000
Received: by mail-oi1-x230.google.com with SMTP id i7so6133053oif.4
        for <ath11k@lists.infradead.org>; Fri, 28 Oct 2022 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9l4Reiul5kWZVTjMF7mcxWAFbYB5wExU6j5u8ZLBeY=;
        b=V492OjIT3SyvrtW1c2m8BLB+vV3EO1M7af82bVmBe1bzPVCikl3m30ZEtceQUCNvJ9
         VZdQlQZjIWPft4blGtQ8gnLqhD1tuSmKyAErvln0FkaGRXFjniKJBqQ6m2iXPdqcvX0q
         4rfNX2Tb13TSNUuzh+nwFkj69FmK4H2r0DzS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9l4Reiul5kWZVTjMF7mcxWAFbYB5wExU6j5u8ZLBeY=;
        b=IJn3OC3GtdlWSvMdJFWa4xYvTHaT+TPrWCZtsU11xMETWqyuv381PywsaytwStJ8E8
         zT/Js77XirMwCh5tj0YN3AD6QU8uZ+vPrDuUzLILlnMej916v681u46FDimLc/g/1JLZ
         Hej5/JJT81Bc+/1NGPkg4g0tZHB7vHH/VZvDbFdFPrzGLALlZCqFx1c5V6cmtJ30Lon2
         YmPbKGeta91TY61+LNsMgxWNPbBF4MmupExYcm/PBU3KtcgDw2vIq997Uo8LPmUIuKmP
         61uMjQl6CMuzKf8JecsaqzBidN2JGqfdX78aHUcve61FX8H/FA12xtzHJqZCuhS7DCBV
         X7Eg==
X-Gm-Message-State: ACrzQf0m7BZlBmRNSlTT2lUPYpJLNfTI2bSWShI5j7+pmdG0qGWnEI3s
	JO7UGomIA6IMI/GjACS0mnU8aA==
X-Google-Smtp-Source: AMsMyM7pvtD2TgbyLQhBWfjIZMIk4exBPzSDvFl273JW7wNosiUYumstYOXttpTzwg38jIMG098UPQ==
X-Received: by 2002:a05:6808:642:b0:359:a432:1eca with SMTP id z2-20020a056808064200b00359a4321ecamr8336575oih.220.1666963550572;
        Fri, 28 Oct 2022 06:25:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:9770:4850:4463:87cf:eed2:97cf? ([2600:1700:9770:4850:4463:87cf:eed2:97cf])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808057100b00342ded07a75sm1504889oig.18.2022.10.28.06.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:25:50 -0700 (PDT)
Message-ID: <22be4248-9c5e-e6d3-5e49-e0d87ec52e4b@chromium.org>
Date: Fri, 28 Oct 2022 06:25:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure
 initialization
To: Kalle Valo <kvalo@kernel.org>
Cc: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
 <11e005c2-2363-d63f-9f3f-3ca811737231@chromium.org>
 <87pmecgrd2.fsf@kernel.org>
Content-Language: en-US
From: "Joseph S. Barrera III" <joebar@chromium.org>
In-Reply-To: <87pmecgrd2.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_062553_646286_6CE06D46 
X-CRM114-Status: GOOD (  14.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/28/22 3:44 AM, Kalle Valo wrote:
> "Joseph S. Barrera III" <joebar@chromium.org> writes:
>> Do you want to add a comma after that last list element?
> 
> I can add that in the pending branch.

I think that would be good.

> I would prefer to have a comment to make it more visible that an empty
> element is needed at the end, but I would add that outside of braces?
> 
> /* end of list */
> {},

Ending a list with {}, is such a common idiom that adding a comment
is kind of just noise. And if you look at other such instances of
ending with an empty element, you'll find no comment, just the {},.
When making changes I prefer to stick to the existing coding style
as much as possible, so in this case I would definitely omit the 
comment. But if you do feel like you need to add a comment, I would
keep it on the same line as the empty element, probably like

   {}, // end of list



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
