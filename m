Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4152C001DE
	for <ath11k@archiver.kernel.org>; Wed, 26 Jul 2023 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpDniG/3CwLPe22WstBoS8AjU0t9+bAuaWZ6HCNv12Q=; b=nwRHHN2gVeHFeg
	Gb+gMUwtMOjjHnZMSaC63x2qKdvA1BOkqHNM4JfZ0fpJEY2l93EdeKkhNamPxkLJ2yop4F3AXHkP6
	Ul5DCocl61bpK6FRjoGyWuerKdY+vJzjGVU7QVTveda3S0vdaZfv9OoVkNzmOyS17v63v8S3x+vq/
	5LZxXC8XRZlPaiXFB7O9Ww6S3Yt92QEVwgcQRxLDqpIducQFObLy/dUM4GcUxIYXxM8Tq/Q15IlCo
	zkPglCOGwuwdOLQW8sRca17ZsdgjlRCYvdv8w3WLfnCnHMS08u8gfJdipEsa1scd9C7QE/qReHSEa
	ORlxBNSEEvQs+K+3g19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaiA-009hwY-0W;
	Wed, 26 Jul 2023 09:21:38 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOai7-009hvX-32
	for ath11k@lists.infradead.org;
	Wed, 26 Jul 2023 09:21:37 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qOai0-0007bE-Sl; Wed, 26 Jul 2023 11:21:28 +0200
Message-ID: <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info>
Date: Wed, 26 Jul 2023 11:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
Content-Language: en-US, de-DE
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Kalle Valo <quic_kvalo@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Atheros 11K <ath11k@lists.infradead.org>
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
 <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690363296;92088a0c;
X-HE-SMSGID: 1qOai0-0007bE-Sl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022136_123886_36215240 
X-CRM114-Status: GOOD (  11.31  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 25.07.23 11:17, Manikanta Pubbisetty wrote:
> On 6/26/2023 6:19 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>
>> Hmmm, there afaics was no real progress and not even a single reply from
>> a developer (neither here or in bugzilla) since the issue was reported
>> ~10 days ago. :-/

BTW: Kalle, many thx for picking this up and posting & applying the revert!

>> Manikanta, did you maybe just miss that this is caused by change of
>> yours (and thus is something you should look into)?
> 
> Extremely sorry for having this missed [...]
> 
> Hi Sanjay, [...]

FWIW, Bagas Sanjaya just forwarded the report and the reporter is not
CCed afaics (bugzilla privacy policy does not allow this, which
complicates things a lot :-/ ). You have to use bugzilla to reach the
reporter: https://bugzilla.kernel.org/show_bug.cgi?id=217536

Bagas Sanjaya: wondering if you should make that "I'm just forwarding"
aspect more obvious in your mails. And it afaics would also be good to
mentioned the author of the culprit quite early in your mails, as there
is a risk that people will miss that aspect otherwise.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
