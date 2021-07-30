Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D166C4320A
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EBBE60E76
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EBBE60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBeNtEoe9nAIFpfw3wIZXkQrJJxPJxMVRTqeAbAlPtg=; b=XhQTeGf+ZbeB0pVCcT7JAj2HUG
	Xm2tgVQSSThDKUm4KBWZEw1kNJ/2t/c9gOJR0dWSsbGCxBv98A/bayKhdJ6pc52i2Ui64qt1HqFuM
	5oM8+c4PHEOZ1vA1b0c5QsOT4ElchA6rHogSAHRD8V46of5acX+dzdvcH+emvmLtKNFXAaQ9ObAaO
	OCeRbEMvpaWfpZ6zjFGMgfWmiQq7e4pFwNNUgOOfztsWuBJjYcG09n2X8Efg99OtbhmK140e1QgOA
	lcBs2LECnJ/ly4w7GefyfdpnBanmDFZ1HNcmP19ioX5OyE/e8/vbjtY1VMivI6ZhKW4sJBXR5fA3c
	3R/NMEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9PP9-0084sS-Tb; Fri, 30 Jul 2021 10:06:11 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9PP3-0084qL-JN
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 10:06:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627639568; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jf9fsBbuEZby6oMpl/uX07+OTMiKf9yOt0Zn5mriWOY=;
 b=JlR+8b8OVu32esWjTMVrObgLRikiw6rv11CPL0SvU+q2G7vYktUA54WF5hM9Dd0vXdk0qlYM
 FX5Qs0egQnWenusMDQLkxj8Ff8Pyb7Sw8eGGvUt1xxTVINvZ/gUXVlyOzmMnq1InkT0XhheR
 5BVbhtSdhYaHOjOM6XK9/v+Fcwk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6103cf0896a66e66b2e4d9be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 10:06:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8245C43145; Fri, 30 Jul 2021 10:06:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 51C3FC4360C;
 Fri, 30 Jul 2021 10:06:00 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:06:00 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 5/9] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <4647af4472b14452347a0817c25c3f61d174bf5e.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-6-wgong@codeaurora.org>
 (sfid-20210517_222029_223410_9F039F8A)
 <4647af4472b14452347a0817c25c3f61d174bf5e.camel@sipsolutions.net>
Message-ID: <b405fd6772b6ca1333230128335b8b38@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_030608_334558_1C4FC4EB 
X-CRM114-Status: GOOD (  11.77  )
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

On 2021-07-23 17:27, Johannes Berg wrote:
> On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
>> The power spectral density(psd) of regulatory rule should be take
>> effect to the channels. This patch is to save the values to the
>> channel which has psd value.
> 
> It seems to me you should also add provisions to allow regdb file from
> userspace to have the PSD value?
> 
> johannes
This can be added in future.
Also anyone who need the interface can add it :)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
