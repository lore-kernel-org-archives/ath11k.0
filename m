Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57220C04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPpS4kMBYZhhEgQdHFMYPZ0872c7ssFHxXO4y6m13zw=; b=AIbmTJ5oQY+jer
	HlbX5HggU2WBjvcBk7hCFheHwmBUdGJ3f+ROyqmOpGPfELHJeQElTlbzyDda1xY1UIon1SMCBSvsS
	qUHuaoIc7BvrIutKjFrqbWeFOYIQ8NMKhE7BT6bnsUGD/bli1pR3AT9kjWt9JbL+LKxDwqSfkUROV
	3f5FEERtBdU+CN1bDQZEmP24OfI/OHwS/CXLeKpIqt8XWpRMCd9iIPR9b6hXu9ZA9EeiF3h6NJ3MH
	zznrr3VjpmHoz0lNVTdaAay204IkDW/+VNXREV1fITWzAlgNX76Z1jQtgHlCCKoAkpeEAL/Ncf/DM
	VO9PPxKa5AUWxLDhQ+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUBp-00FZY1-Hk; Wed, 28 Sep 2022 10:21:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUBm-00FZQq-7Y
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 10:21:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id v4so11788165pgi.10
        for <ath11k@lists.infradead.org>; Wed, 28 Sep 2022 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Q6fDgYkx0WTgkjkMUG88w5JfAvRGMT0TPuXWh7oqnAc=;
        b=U9uU56abMls5T1xlmFO6UX674PUYC7hzBheFRkPbS+Z2eQRhEqaM2L+89jPzP5f4Un
         uE5aC8HpE3VQWnE6Jkn/eE95Sl3kNURf4k+xN9ZFTwWFDSq77aR4JgbyLgxqPuRs3EzJ
         Yh9tgLEqTkBPmo0ABnUnDSKbzR1ucoiHTJXdt/dleqnHj0jqz7Xr0DmknLgLYILzz1ev
         SUvFrzjW5t6obgZ3cWioM7TqieCSANZDq93mRGk51lNvki61pWhFZCG8mMUKAqF9f7Zp
         TwdDr8eC4iswKeyeT7140wIn+LR/JOEA45P9DsOZ6HDA8Ztl4eVdq6ZEUtsyaI3K2BmW
         c+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Q6fDgYkx0WTgkjkMUG88w5JfAvRGMT0TPuXWh7oqnAc=;
        b=UcfmkWkEJsQmLJ7kuC4lK5kfUlkGeFU730TJimrULcmoBdXPNleVoKJGCv6Qh0EKwb
         w7SnGN9+TDHX7qDClG8OUx25QIAu5rov8PgkJEIyx/TdVlycabCrU/PHpXAJIhuntYs3
         3YflMD203IFobI8l55i7q+ya+Hs3pTfzCyriXTA49c6v85QiwRdv1ZSq/qC6E2qjqRyt
         Kr4j4x7l55a2tMYROKz1szxNh0xsvYF1TTGBZHBYKPz57SlU8q+i5Y8iejLVIzX1aY8w
         ZQqHyvcgzn+LE0dWDPHpZSSjtpVSyvpYeJW9cFxa9j3iRTF4CqZeWuobdI1wo8xMD7ml
         dTiA==
X-Gm-Message-State: ACrzQf08RHBbxHxYY64xLKSdUgHAgXf9Jlvg3xomnLNvv/19p5bHHNZP
	JnRABeuF6YcbfSnRnNsCKMJ4xgaIOP69znE0OkdS1A==
X-Google-Smtp-Source: AMsMyM7UoiUlv1xXWI3B1FlQoN5DnOuqsIRVza8MwBznfyVWjBaLgDC6uBK8JdoN0FH0gFlYtGWr+BnYExlfy9cXYfA=
X-Received: by 2002:a65:4bc3:0:b0:439:103b:fc35 with SMTP id
 p3-20020a654bc3000000b00439103bfc35mr28468628pgr.248.1664360469690; Wed, 28
 Sep 2022 03:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
 <b208fb8c-b7d2-6fe6-3429-a2ca9d7fb59b@quicinc.com> <CA+HBbNF+cPayaLBF3TFQasxQWCyAFzBad++chwVko2_geSd0Mw@mail.gmail.com>
In-Reply-To: <CA+HBbNF+cPayaLBF3TFQasxQWCyAFzBad++chwVko2_geSd0Mw@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 28 Sep 2022 12:20:58 +0200
Message-ID: <CA+HBbNEfgnmZhnyp6hRMHJN_uhNGr+nmKLQvkOupSXhY6jVubw@mail.gmail.com>
Subject: Re: ath11k: does qmi support multiple soc
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: fengbin <arithdon@gmail.com>, ath11k@lists.infradead.org, 
	Anilkumar Kolli <quic_akolli@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_032114_315068_853AA05F 
X-CRM114-Status: GOOD (  13.99  )
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

On Sun, Apr 24, 2022 at 5:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Fri, Apr 22, 2022 at 5:47 PM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> >
> > On 4/18/2022 1:37 AM, fengbin wrote:
> > > Hello,
> > > I have qca6390 and qcn9074 both of them works fine individually.
> > > However when I install them together errors show up.
> >
> > This is a known issue. A solution is under development.

Hi,

Any news on this issue?

This is really annoying on boards that use PCI radios for most of the 5GHz band.

Regards,
Robert
>
> Hi Jeff,
> thanks for confirming the issue.
>
> Regards,
> Robert
> >
> > --
> > ath11k mailing list
> > ath11k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath11k
>
>
>
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr



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
