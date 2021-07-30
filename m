Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2351C4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:28:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7176360F5C
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7176360F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=952VeUuoskkwpJWbEKwdxmBMbYMs5fyCgVczDOewxzg=; b=LPlwH1GICkIy8I6JJTZmlIUtkD
	6U08n1J51q2icftOqqpiTBBORNbLwI827/BLat9vnjukRUgyX+bq5Dn9hzDbKz1UOHD+y9vm/s4Eu
	QGtOggO24UEY5RId07LqrFSIiXCCixtEo9ihex7hBDGPz6hnXqQM21x0fUHhiuNS8wUKQWTj3iA0K
	8hJoosJtMP0PFdGfz282EVe/tMo8WqtDwlkqw8FHsfycpcfCFQTfyj4LVECPGAH1WCepddQnwaEOl
	mptvSLH/NzwrAQtysMcmNWlXw27R2ZNqMGPynpoODUNMoXKUv7gY4c93ZB2ILhiDjgQEashUSCFfZ
	wYBaO4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Pko-008AAa-5w; Fri, 30 Jul 2021 10:28:34 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Pki-008A9j-Bi
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 10:28:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627640911; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=J1V0sxXmiVZC4oOGGO4PUc8fsmDPnaErViXC0bbs0Fs=;
 b=BoKsXw5ZB5plx8UX62hk/ZJvQnQ4G1fsoklpR8C3JTBF3e27q/NTYjAK+Gg0ORL9mwNx6jKP
 /z75LDgmJo9PzTGrA2I+0ONa6TQKHzbquEc0hLPR1GZ338ochlD+rmAOjA3iDOloK5blotTn
 fVjFjj44BBW49//y9+AX7PdN2kE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6103d43038fa9bfe9c9c7e3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 10:28:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D6C8FC43460; Fri, 30 Jul 2021 10:27:58 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A1BEBC433D3;
 Fri, 30 Jul 2021 10:27:58 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:27:58 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 6/9] mac80211: add definition for transmit power envelope
 element
In-Reply-To: <a8c4be501b85bcfe478d9597f4d6f90b2887c57c.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-7-wgong@codeaurora.org>
 (sfid-20210517_222029_289940_80C21857)
 <a8c4be501b85bcfe478d9597f4d6f90b2887c57c.camel@sipsolutions.net>
Message-ID: <6d287d059a598c54d9932cd66328f1c3@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_032831_619506_3864F563 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNy0yMyAxNzozMSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBNb24sIDIwMjEt
MDUtMTcgYXQgMTY6MTkgLTA0MDAsIFdlbiBHb25nIHdyb3RlOgo+PiAKPj4gCj4+ICsjZGVmaW5l
IElFRUU4MDIxMV9UUEVfTUFYX0lFX0NPVU5UCTgKPiAKPiBJcyB0aGlzIGFjdHVhbGx5IGEgc3Bl
YyBsaW1pdD8KPiAKPiBqb2hhbm5lcwoKWWVzLApJbiAiOS40LjIuMTYxIFRyYW5zbWl0IFBvd2Vy
IEVudmVsb3BlIGVsZW1lbnQiIG9mICJJRUVFIFN0ZCAKODAyLjExYXjihKLigJAyMDIxIiwKSXQg
c2hvdyA0IHR5cGVzIGluICJUYWJsZSA5LTI3NWHigJRNYXhpbXVtIFRyYW5zbWl0IFBvd2VyIElu
dGVycHJldGF0aW9uIApzdWJmaWVsZCBlbmNvZGluZyIuCkFuZCBpdCBoYXMgMiBjYXRlZ29yeSBm
b3IgZWFjaCB0eXBlIGluICJUYWJsZSBFLTEy4oCUUmVndWxhdG9yeSBJbmZvIApzdWJmaWVsZCBl
bmNvZGluZyBpbiB0aGUgVW5pdGVkIFN0YXRlcyIuClNvIGl0IGl0IHRvdGFsbHkgOC4KCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
