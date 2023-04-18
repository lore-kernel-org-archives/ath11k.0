Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A320C77B76
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESfjE6FxOrAo3SLiOyWg1uMiQ4orPA1z5SHuvh6sU8E=; b=uMxtlQrPNe1nJ3
	gQEn55zTDDDKbQ5P0BmjGoRbHHxVg9YP8ktTX1XfOmV1F1ubvRSgCoP7Kbygb6tEAMjNhz1Ztzu/3
	1C1h+fDM99C8q2r4oXqm2EbTDu6CafTztHMqaGBjC0k6EHLM0UrZhsF/SXMZiyL7QUhEfWSi9U9ib
	4k6jUBvjX8833CMN2KqVVnEDlV4QhFso8qUEmlbToRGLwrrI4Z6iRcCxXfJSwxKQfZLS5Q2kEpbqP
	Uhn+uQW6+D6CMnF0eglY7hDcGsNPp8OXmnc/v2jgV1ULamqI92zEhHGvMGJGGuAPdub34cespmAA6
	+ppNa0Qkuethd9cgOZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohMm-001Pxv-2X;
	Tue, 18 Apr 2023 09:11:12 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohMk-001PxC-2N
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:11:12 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so1229373a12.0
        for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1681809068; x=1684401068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJp5Fs4I3X3Lrnwpv87MvZSqBNI8Q21ROLa2nrRB3jM=;
        b=liz70RhSEvUJBQDlQJMNJJgwY1MWaLTzc/8x03i1tcoTUCi8meUXBI0A5bk8Yz7Mb8
         i1WfhofrtvM9Z67JA0aGjPW2bLpki2kC/sQaw/rNu/CMNm6W2441/uRkUIS5rzb26xjq
         TCu+Tnvi478FcDxqw9ghMYZv74s5S3Q4f9hiD9QblK12BB2LkDSc4+KiRx+6c90qTpmW
         lOV9DISfeWmh+K4NUivEDAdQSEre/p2VnLy8JkUJ8Xgg4iTLcumq2f3uqnjiBVIcCVlh
         arscxd8SAmF11hilDiZTbySotfDeMwsaPD99Ktoep7pB9dtoLJee6ibCZ1sGtHO0o4Md
         XJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809068; x=1684401068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJp5Fs4I3X3Lrnwpv87MvZSqBNI8Q21ROLa2nrRB3jM=;
        b=M97W+STRm+hvzFOjYeOp+CvMmnmEtIiNl59BYp3+mLzvBVFnAQ8V3FW6dh0ILk8pXY
         pX419OEXAUf0pYqfH0p9zLh1XJbXwhV73ucg6ohlZz8m+QdKqos8W5XprjAuGR1SIlsZ
         wIUZ8fFfCi8PokCCeZ5wIqOIgOnmOcjqnI/poxBsCTeconE9uhnL2lavk5EVT6lQBYAF
         siRSwE6YLkf16lPcqKvLcbsdwouUhUpILNDbcx0xD6nFrtRME40/sEQ5RvT4HpQGcsR0
         o2t0XCjq7rWK7aXr2ehNorqDuLsKcpgxqpfZm1qSUMpcdyEZG6QLIeGLUzOtTiUz/+WK
         iG4Q==
X-Gm-Message-State: AAQBX9f8IRkPnep3ezjoqF3sIE2NDAVPqYhZHJ4Q2VYN0ptHdf/O33mk
	mJX9s9mGODKWCv2wDFM/Ztjo3+NcVhijvJxUxF2Eyw==
X-Google-Smtp-Source: AKy350ax1Ty7pe1kRJRSklKhtb/9FVN3xE/4WR/MxW30SOZ5Db75pzvm/9eQ/URjR+jDmCyyRgfPd1+ankwBBk8D29g=
X-Received: by 2002:a17:90b:1887:b0:247:afed:6d62 with SMTP id
 mn7-20020a17090b188700b00247afed6d62mr1302455pjb.46.1681809068563; Tue, 18
 Apr 2023 02:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
 <1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
 <CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
 <87fs9ndh6s.fsf@kernel.org> <CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
 <87bkkbdcfu.fsf@kernel.org> <87pm8iaggt.fsf@kernel.org> <BY5PR02MB6164BAC2A418B3C5462C2C348F9B9@BY5PR02MB6164.namprd02.prod.outlook.com>
 <87mt3b6nz6.fsf@kernel.org> <874jpdwo90.fsf@kernel.org>
In-Reply-To: <874jpdwo90.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 18 Apr 2023 11:10:57 +0200
Message-ID: <CA+HBbNFTfAXWw-39F=ov8Omg6qKWvVJtWMC00+N8a9GP8Jo06g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
To: Kalle Valo <kvalo@kernel.org>
Cc: "Muna Sinada (QUIC)" <quic_msinada@quicinc.com>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"Anilkumar Kolli (QUIC)" <quic_akolli@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_021110_780059_26B36865 
X-CRM114-Status: UNSURE (   8.59  )
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

> Muna now submitted a fix:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/1681762947-13882-1-git-send-email-quic_msinada@quicinc.com/
>
> Robert, can you please check it? And if it works a Tested-by would be
> nice.

Hi,
I already saw it and gave it a quick test, for me it brings up 160MHz
and I have requested some more testing from other community members.
I will reply with my Tested-by tag.

Thanks for fixing the issue.
Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
