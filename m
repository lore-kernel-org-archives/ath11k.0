Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C1AC4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uG1NhDw6PKvPJnncdvPDTqawqTBZ9/3GLUgAKyTgCQ=; b=VrMgfszXCBCEN7Ic3KD4qBIWKj
	sCnRtBrZHd/qYDqF2+u4sHqTq33vShoYTh3/DNFLCp3mt004l3bwo6jS+aCV0BK92Cs8CRSiVd39c
	U9l9g9gGAicKLpuxFuGX5QVJVw+i6YT65sCjx9LvQJ7/b266EVJKhQZyHH/AKRAcEr/Rbh9N8t3iJ
	fZe42fCZOLX4GzuijFJEb0m1wNcyu3HRHwrSyuIkb4Y/Lu/epcE8ECSIawGoSq2q3M06TDt72oJxK
	SR5vnhbMh9KR5Y7xvmNhxMDwRUnV+0/0CY/YvVHRviOF3I0olm62QVkxtL5w/eoYl7lkg6FwnJcZo
	/vOBP3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOso-000000090Iv-0h4N;
	Mon, 15 Apr 2024 16:08:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOsl-000000090HN-2pN6
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 16:08:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c66b093b86so3140932a12.0
        for <ath11k@lists.infradead.org>; Mon, 15 Apr 2024 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713197313; x=1713802113; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7uG1NhDw6PKvPJnncdvPDTqawqTBZ9/3GLUgAKyTgCQ=;
        b=Kt/SUyXUqOmeSKb7G13WMQI2tjpVufiywfhLsK9Khl7tZCjkKbw8c/GzrsDyiz8QGq
         51QBOsVlC5s/z/HNZKuZ8ypmg9Kh7xLY+MlDf7nQgx3LG5bOzzojvm9gNIZqW27daYxm
         +6AsX53aCkiGPs4mBIUYyWRG4iIeC1R0IAzQihuJjxIHoEN5Ts2FyfsnmbthA4rsfgdy
         lG0N7YMH0PCs7McxSgIJlj5cntRBQLbOguxJr95gSwff3S898ZsAwavRD4MGJkoqGtDy
         92kYBVSUTwJhoK2r/FZ7btBwFk85eoxBSOm0w6KGfgch3ZicpIzveebiTnbfQ8E4Gw2b
         zvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197313; x=1713802113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uG1NhDw6PKvPJnncdvPDTqawqTBZ9/3GLUgAKyTgCQ=;
        b=ZtocwWOFL8qc9UvBZOxkpyDsq8/aj3mNRRg/8g2M74kL30wM+TK9ZkyZLRYiPZBQii
         Sx77qrOQOD70tfG/ismatQ19F33OgY7+CJ6tD1qkdHhOyuivDIKEOm7PmFsR05yA/J+N
         PFiSSxAm/9QNHgpitS0jzhyHKeti+OQzKEihcwU8bZUaw5Lcs0YQWCxWKKeIY0EpsCVI
         6yVx0JTq0WAuq9OBwQTAtjG7aI8MjJSKLcvVpgSiGQysgyf5Sro7U4gJypRve2as2+St
         Q+hQhdQmxfQH2VgD1KVE0qKIpJh94TKs60NEQAjdVmwgc/mUaSbIyVqQSd4LQJFLKWR3
         jeyA==
X-Forwarded-Encrypted: i=1; AJvYcCXg3Tr5flRYnyzc9LhYu2yZ/iVyerjbEXaZdt/WdGYPGCFK6433EQtGSNDMvXBuuIbTIzcKchhEgLjcnDgPgnBO5T5B+k9C1k2Q3w==
X-Gm-Message-State: AOJu0YzDsMkBsfNFIYqmyQhsnmE40Vnr8aiFDv6c+3kU4VhAgdTpSdpb
	GsfTJSpHgklh2Qc863yGX1aCkVcz1fFgkGRCKLdQZ6FBm/tH8cdaenICguZFk2/9zV5kjZSp5w7
	UNBmMUkaBc8N2pp5D731chEQFfW0=
X-Google-Smtp-Source: AGHT+IFWO6nlrMJmutSX59RW7e3qJHcpdliV/hqVvvX5tCC4s9nNzTrSMT2rNbIwYz3dSTVQ1wEOkjiblCWkFGYaVuc=
X-Received: by 2002:a17:90a:5315:b0:2a2:6244:32b5 with SMTP id
 x21-20020a17090a531500b002a2624432b5mr124718pjh.11.1713197313458; Mon, 15 Apr
 2024 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240412162510.29483-1-robimarko@gmail.com> <20240412162510.29483-2-robimarko@gmail.com>
 <4a1e0cb6-c319-4eb1-9bd1-5ff13eabfe1b@isd.uni-stuttgart.de>
 <c7106c8e-0c99-4160-966e-b1a8ba5770ee@quicinc.com> <87ttk2y5iz.fsf@kernel.org>
In-Reply-To: <87ttk2y5iz.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 15 Apr 2024 18:08:21 +0200
Message-ID: <CAOX2RU535xy_nGBnsqZzbjF1VGqNRtFKdT-zMVTNTgUmi0HeXw@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: support DT ieee80211-freq-limit
 property to limit channels
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_090835_735926_F0289072 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, 15 Apr 2024 at 18:06, Kalle Valo <kvalo@kernel.org> wrote:
>
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
> > On 4/12/2024 12:52 PM, Christian Lamparter wrote:
> >> On 4/12/24 6:24 PM, Robert Marko wrote:
> >>> The common DT property can be used to limit the available channels
> >>> but ath11k has to manually call wiphy_read_of_freq_limits().
> >>>
> >>> Signed-off-by: Robert Marko <robimarko@gmail.com>
> >>
> >> I've seen this before.
> >>
> >> https://patchwork.kernel.org/project/linux-wireless/patch/ed266944c721de8dbf0fe35f387a3a71b2c84037.1686486468.git.chunkeey@gmail.com/
> >>
> >> (dt-binding too. it has/had an ack)
> >> https://patchwork.kernel.org/project/linux-wireless/patch/fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com/
> >>
> >> sooo.... this is awkward.
> >
> > Patchwork indicates Changes Requested
> > Any idea what changes Kalle is looking for?
>
> I can't remember anymore but most likely I assumed based on Krzysztof's
> comments there will be v3 and missed that Conor already had acked it.
> Sorry about that, I set Christian's patches to New state now so that
> they are back in queue. And I'll drop Robert patches. Does this sound ok
> to everyone?

Sounds good to me, thanks for looking into it.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

