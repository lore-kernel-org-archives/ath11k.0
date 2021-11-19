Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B111C433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 15:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FB361AA2
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 15:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17FB361AA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ/0d/wSMgvQchkU61NRWDHznr+bq7/xtri3NsqdRxg=; b=XedVVNw3z6yQbi
	n5A/pd5zDYWed6iSemnMw9wvPPx45fV4or07ufkCS8M9Pqn0UEqZtDPwZpZ+qJuhIwL9DaUh4568+
	GJOvt0yvTPIpXV4H2amDhkZhpJ+uV8CyGovM08tpgKDgSc5E4X4CHNvT6upaoO6hTLoGatGtYSFiY
	C8ENjrSQaWC5Jt2ygf/d8y09JxRNnwQsR5Qx8yElB4LmXuB7fIxB4ZiXYATAoalpgFDi0M2xpKmRc
	LDVDbSZXNMmvF2fmtbtUdL8RW0Uuzo4j5JrB7w9UFL8PE3+zycZyDox3zKHeR+KzNRJsTG5hWE523
	wFnNS4/UEpE4W4m5+djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5ds-00Ar0G-B1; Fri, 19 Nov 2021 15:17:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5di-00Aqxs-4t
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 15:17:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637335049; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=98RvqJggobL+7ravMaBg0zgt1DNk6wTkO7cgYtCsuCU=;
 b=r5y/lxq+TxjYzZUnBa3yXR8ch1Q6eQeyjOy6NZxbAGAuX3JqK2I7Tx9nszzLmCi2EhGUNO4L
 zGfe/65dqajLIt6mjN8evkNe0Z74f4frNzuLYgnBo5B+J/kqo33xQcH+KXiclYS6KzCoMPmE
 VGaPM67x9s9NnOzpmYmJoES4HYU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6197bffa1e1d2f5233b8842c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 15:17:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DDE7EC43616; Fri, 19 Nov 2021 15:17:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95882C4338F;
 Fri, 19 Nov 2021 15:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 95882C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>,
 linux-wireless@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>
Subject: ath11k: using boolean bitfields?
References: <20211116041522.23529-1-quic_wgong@quicinc.com>
 <1752085.FWK5zBq28I@ripper> <87mtm3dwu0.fsf@codeaurora.org>
 <2357945.8AGfkZV0UB@sven-desktop>
Date: Fri, 19 Nov 2021 17:17:08 +0200
In-Reply-To: <2357945.8AGfkZV0UB@sven-desktop> (Sven Eckelmann's message of
 "Wed, 17 Nov 2021 09:46:08 +0100")
Message-ID: <87v90ob2ff.fsf_-_@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_071729_514000_5CC3049C 
X-CRM114-Status: GOOD (  22.35  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Wednesday, 17 November 2021 09:12:55 CET Kalle Valo wrote:
>> > https://www.kernel.org/doc/html/v5.15/process/coding-style.html#using-bool
> [...]
>> 
>> Yeah, I have been worried about this as well and we should fix this. But
>> instead of u8 I would prefer to use bool like mt76 uses:
> [...]
>> I didn't even know using bool is legal until I saw it in mt76.
>
> Interesting, I was also not aware of it. And it also seems to have some 
> interesting implications when assigning values to it (example 4):
>
>     #include <stdbool.h>
>     #include <stdint.h>
>     #include <stdio.h>
>     
>     struct test {
>     	uint8_t u:1;
>     	uint8_t u2:1;
>     	bool b:1;
>     	bool b2:1;
>     };
>     
>     int main(void)
>     {
>     	struct test x;
>     
>     	x.u = false;
>     	x.b = false;
>     	printf("u %u b %u\n", x.u, x.b);
>     
>     	x.u = true;
>     	x.b = true;
>     	printf("u %u b %u\n", x.u, x.b);
>     
>     	x.u = 0;
>     	x.b = 0;
>     	printf("u %u b %u\n", x.u, x.b);
>     
>     	x.u = 8;
>     	x.b = 8;
>     	printf("u %u b %u\n", x.u, x.b);
>     
>     	return 0;
>     }
>
>
> Result:
>
>     u 0 b 0
>     u 1 b 1
>     u 0 b 0
>     u 0 b 1
>
>
> The last example is basically the reason we see stuff like
>
>     boolean_like_value = !!(some_retrieved_value);
>
> when using unsigned bitfields instead of bool (bitfields).
>
>
> And the memory layout (on x86-64):
>
>     $ pahole test.o                                    
>     struct test {
>             uint8_t                    u:1;                  /*     0: 0  1 */
>             uint8_t                    u2:1;                 /*     0: 1  1 */
>             _Bool                      b:1;                  /*     0: 2  1 */
>             _Bool                      b2:1;                 /*     0: 3  1 */
>     
>             /* size: 1, cachelines: 1, members: 4 */
>             /* bit_padding: 4 bits */
>             /* last cacheline: 1 bytes */
>     };
>
>
> To my surprise, it was already mentioned in one of the discussions [1].
> Was there anything in the discussion which I might have missed and 
> is a good reason to not use "bool ...:1" in structs?

No responses so must be safe to use ;) Changing the subject to gain more
visibility. But IMHO we should just switch using boolean bitfields as I
would expect mt76 to have noticed any problems by now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
