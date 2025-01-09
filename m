Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE4CE77197
	for <ath11k@archiver.kernel.org>; Thu,  9 Jan 2025 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRnYeIOnuWC95SmBfEcCp3VRJBQGt9FCRwhkajjQKxQ=; b=FNJiWwemm1iByW18gzOS7KBEAV
	pIFBYaUhIW21uSzKXwZgqR5AhkzfZd1ZGeOThljInPnK8Ct7w/toRq9wdTCQn+MSCYRTpc9uI+VFD
	wm9EO+hkwnmxg7Nav7lgySS+S0mkJOKwgzG3FRI+AbFztAhEEQErsorPF0EAbd1uevvUlG1W9k9Le
	o1UFLqXpTEP9q2XDmh9JilGFmHbEnXNJ1vELJcMIzk0pro7YVXAsbWJNqJ7ICl9+Lcr3rs0NjFm6g
	eGCpuKRLWutOVR5KAkP1S939X9NQzEiXe+GYyDWWTq1q+LOPyuz1JGgH4hVc3OWtZY1ZjYQ3IYEo/
	Kkv8cZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvS3-0000000ChDg-2x8Q;
	Thu, 09 Jan 2025 16:32:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvR0-0000000Ch67-28cQ
	for ath11k@lists.infradead.org;
	Thu, 09 Jan 2025 16:31:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4363ae65100so12908995e9.0
        for <ath11k@lists.infradead.org>; Thu, 09 Jan 2025 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736440260; x=1737045060; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRnYeIOnuWC95SmBfEcCp3VRJBQGt9FCRwhkajjQKxQ=;
        b=IIreWfU+qOE/ziSVacPJff5mfvUJKy4wLlurU5PJLMzpEHUWrp9m6hg7MLyQtH93D9
         e2tpMjkVAqW9UGsdj3/y90JXvFjh2WEG/lCoU/McBFwMLu8nZsT9DKyR8yu5kCfyH6lE
         Pl4x9dPcIpITqTpseFGzM1XTXNU+5IDkXHdNtAnk2EGGTw97xTRc6sU9qZl7cFNgxLt9
         0nokg4DKz3CZW2KYHiLjJysW9QztL4fCyl0wTXlbJJeCtMCnD0PAaVc+Ek9x5L11RvwK
         qP/6NRKID1t50vn35KJQ4QDYv/0kAYGlY1wWgwMkfL6rwdvmYuUHwGpjQ8pOqYulkT3D
         LAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736440260; x=1737045060;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oRnYeIOnuWC95SmBfEcCp3VRJBQGt9FCRwhkajjQKxQ=;
        b=Sp+PQS3egP0TUF/BkeSaF6P6+4wiD7hGI57fHNY0gZz6S4bTJWMsGXTALjoNVEihtV
         e+PZerkMtHDF3BwfIz+cm3XPCu88JaWrWhoUuyFGTBYonQHcJGWdDnMfnTVEHzVxjOpH
         woKKbgWVkp+MTYFws6oVYC1kEQicnQjpqxHt2joD7AIddG7cCQpL6kcxCnH41LHs6vsM
         3HeuaPKWiIW/KfsNNOEDQVy+nFZ6Vc19jZVnZ0uLPeYsn4TOkAYPmUmjuA6qAYAXHJm3
         NZGQppKEjXJpNEUxTw7FIh6Gzip9K7wbgEGVvdejIzPneKa/B8fvnp8c1SAwj7kG/M7j
         oLYw==
X-Gm-Message-State: AOJu0YwUyEpcNHmhsVxb3wXLRG39vN8lt2eOxPiIWOHs5/LG4art7WfP
	OGcw2lu7U5SIJ+DqVUpBOEFolOBOhCZosLk0kYFGYMTYBCpgS46N
X-Gm-Gg: ASbGncsImtynNjFoCK4kcAEI42GSISwC0OGu7boijiI2UqMPeF/LaAv9UnXbJo6wzw5
	yrC8pVEps0tvz68ehE4oHo8UzLBTue1da96Ood65lAbOlIaFWAzV56FyWlNQR4Q5tiO9Kfp5Us2
	26P/kB1lzEUE/1MF0STdtmVium7Tqy39wmZCBK4lZdZ8flb/9qSVUGGrNRmhgJxe+XF71qzgwbZ
	xbfg3fn9iteOPkxaEF7AvV86WOThTwhzSIokO7Jd/p7f5hzWwBGQ/PnPNvR/mmkUPU61oeEM6o=
X-Google-Smtp-Source: AGHT+IHWfQFGsjf4+Y+aFqbNEF+ExZXERgNKPIjkUWTWO20jHQ2IDfvj88w08hTEa83JRpGzFJXLzQ==
X-Received: by 2002:a05:600c:314e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-436e2697947mr78812065e9.14.1736440260337;
        Thu, 09 Jan 2025 08:31:00 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc860bsm26105725e9.9.2025.01.09.08.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 08:30:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 17:30:59 +0100
Message-Id: <D6XOP6P8Z4J9.1ZIE5L6I8DSRQ@gmail.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>, "Steffen
 Moser" <lists@steffen-moser.de>
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k
 with IPQ8072A (QCN5024/QCN5054)
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kalle Valo" <kvalo@kernel.org>, <quic_ramess@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
 <Z2Q9POuV-6MIdzRf@pilgrim>
 <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
 <D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com> <878qrkdsr7.fsf@kernel.org>
In-Reply-To: <878qrkdsr7.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_083102_547470_61A9F5AA 
X-CRM114-Status: GOOD (  10.43  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu Jan 9, 2025 at 2:25 PM CET, Kalle Valo wrote:
[...]
>
> Good question, I don't have an answer to that. Could someone (also
> outside of Qualcomm) send a proper patch ASAP so that we can solve this?
> And it's good ot include the link to this discussion and describe the
> symptoms the revert is fixing.
>
> This is the patch in question:
>
> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win=
.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-ke=
ys-properly-when-DISABLE_K.patch

I'm not so sure as how to proceed to post a patch from someone else while
editing the commit message to add more info...
Rameshkumar Sundaram is surely the best person to do it, no ?=20

Thanks

