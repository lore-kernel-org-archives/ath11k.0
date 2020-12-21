Return-Path: <SRS0=/m/M=FZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9826FC4332B
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:16:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AE623103
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AE623103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OTLyO1eJH/KkujAcFKdbuw8nlawcaV/xGQcW4MoRNms=; b=thplUfHAfB0cLNOPbHr6HVUtm
	Qwn5u/MBPTjICPmNemR/mGCegOijgXiCbobjwxJz3hc5cY0b9aBd4thpDilfmq/V4IGFY0r0sgtbk
	Dlq6BuZ8PTOdDGmXtGj4aMCIAHV+cplINcv+2KObKJHsQqR4A/s/jWdaqlum2i1hKr8bF8ll5tk48
	Dkiyd/619hbbOGm3zHhiQztllaH6U2eta+vvi8ZUFnGhdlND4Ywj5YtzlCDI3N+GGUQr4dI2hfYUG
	2r62GP+FAhE6bN/mB2PL7LkT3sT9213qgLdyFdhDTDYJCr5JAYHSO6PVjhgxKwkB5vlUKFJ+B/OxK
	RAd2KaDNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krOn3-0006xN-Mb; Mon, 21 Dec 2020 17:16:09 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krOmx-0006wk-46
 for ath11k@lists.infradead.org; Mon, 21 Dec 2020 17:16:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608570964; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9aWCcgBfCToaD6q00RC6Kahvh8B1wNA7tW0auhWk1uc=;
 b=b9cdEGuiU1CZt3DfIimGtteHsrc5EZTAlYbMsxQ4avVgCG3ey0dPX9bIIjSyO/7/UwdA3ZAk
 k6NQeY+w+/ViyGphmxhcHOpsr7dPgpVfyFau89eoH5ETXdaUujRrJZODwihZpMuHOiOWe7XM
 uHgbCHyWEqxK/xEqnzcdrtMInDc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fe0d84f3ac69bd6b8701273 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 17:15:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F990C43469; Mon, 21 Dec 2020 17:15:58 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D35FFC433CA;
 Mon, 21 Dec 2020 17:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D35FFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: wi nk <wink@technolu.st>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
 <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
 <20201220150503.GA4283@thinkpad>
 <CAHUdJJUmW8LZGGn+982gfYUyejiv8kvW9Ho=jXr=6WTW1W3uww@mail.gmail.com>
Date: Mon, 21 Dec 2020 19:15:52 +0200
In-Reply-To: <CAHUdJJUmW8LZGGn+982gfYUyejiv8kvW9Ho=jXr=6WTW1W3uww@mail.gmail.com>
 (wi nk's message of "Sun, 20 Dec 2020 16:39:06 +0100")
Message-ID: <87zh27nkqf.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_121604_233650_B4C7575A 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: Stephen Liang <stephenliang7@gmail.com>,
 Jeffrey Hugo <jhugo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

wi nk <wink@technolu.st> writes:

> Another interesting note is that the laptop only seems to attempt the
> transition when it's plugged into the charger (see my mp4s for more
> info). If I boot the laptop on battery and bring up the adapter, it
> never attempts the transition beyond m0 either.

This is so weird to me, what could cause it?

If you boot the laptop on battery but after the boot connect it to the
charger, what does it do? I'm wondering f this is some boot state
problem/feature or does the behaviour change runtime.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
