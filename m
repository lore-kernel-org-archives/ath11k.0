Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C5F94CB6
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEqeOOMJL0MyuLpaUxwclHIgWXv9VRMqv4q5M1RKiok=; b=laQfBAOIU0Fy57c8UYnwTY4Z3G
	TxVxuaMsFc1t/Z3/1ySqRU/o783mFbU2zdlfHFQcVNtMHMz0ISQJ5f7JCW6Zgeg4wV9t749hxlfzN
	hrvJ1I/R6mTznT4MIsGA9eiVM9z9FMlVV7kwSASp/ROr5D9R5uRUbtf6zSTlMONfmM0gJIM6eO197
	m/85myyd3I1fQ9WX3b6YBSaXGySARtq2rekQOaqjN+QGUO78ienVthgynvnuxNHVo0jLI/6iySnlM
	gkuVuwTfAV5bW9bFikJtF+q9VLxFSuKtioC8f4F6f1qfCOTvd6dwTBKGPQBRE3AAQCGTbFYB1PdGR
	wIfXbtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFKGn-00000009PBo-2MER;
	Tue, 21 Apr 2026 23:12:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFKGk-00000009PAp-3c4n
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 23:12:39 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so2103422a12.1
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 16:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776813157; cv=none;
        d=google.com; s=arc-20240605;
        b=PSXZjG+/hMSVFiBzdcgIuhvaphMB/DCcrIU1Uy+U3efdfWhpoF7R9rcTtKyHc4sFhU
         NgeHv/EmFapHh5va9Tg3Lh91w1tv1kJz1Aoo91xicGs+vhYPbSn9/acEa0Z11RUPr/B0
         6g1xiVoTpVZue3jGV/ndXsaMhE1aCG8jDNg2E9ffgE7OzKcTN0P7Gm2lL4X5NdSfmZwd
         wqQBYWyTzq2caXD9ygcucWUo1HiQyc2QEGCE6Ha2CPkykt8rvXlzvA18wsodcZyfSrej
         QehE/oOp/tJkNJyYezUfZO5ugb8yxg3lldgWR5SPfoJNQUfrJ3VVq+wYa6DK5SSeHbAr
         Hwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kEqeOOMJL0MyuLpaUxwclHIgWXv9VRMqv4q5M1RKiok=;
        fh=GTtNT4WomWgfxvMyhrReZRbwVifOEydXZC9J+MoXl90=;
        b=eXuW10iTC2mJrpY+3xcb9lgdsYAfWl0Lli0RerjydvkiSErjvIFdLUOMNc7+2CZ9l2
         fjc6gdmW33WgOKLmguMAFgPCiBsR95TXOUOy4eAl7MtFnPlL8SzsHeBZQMJMzru5o3oo
         WLgHnVs40xx2PK7CSVgGSk7c3L90Kex3X3ZFkeLZfZpMbvLoboNaRPg4emhkgoPKWoiq
         AQYxbHD8V/M7+Kv0GfIEdDhq8PASjPMScJeu/hMvo9tyqmlJ8psjBDNcjbNQd4VDNgZM
         7GpMyW+nTjABk1FlW+XHCfiLBWMeG9zJGY1L63kpc8cOGB8g+u8xy8FSxJOTZWThrvuT
         T+Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776813157; x=1777417957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEqeOOMJL0MyuLpaUxwclHIgWXv9VRMqv4q5M1RKiok=;
        b=MrIqFATcz3fKjnA//D3IG0L/+2CnL7JMAe0i7nsKvepm/ZDRTZnGLfIimqQ8xcchOv
         fV8PxAZnBNTL1+euHnjfB6RxN0IvfgmxLQG2ax9BsYOD7pFx4AkU0EcriqWIcnluAA6B
         a0HY/OMJjFW5JnPxZTJi93pvAWmkwz3zuIIIK7RTClvjT920AloWaedP9Mg/ASbiEypx
         sgNEgxXbFGIQ8KtlWIioetadPL6kDupoU1D0J8Qv9nNDpE0V2r9qJbkcRtww9FXUtdNs
         Ycft3eBh5KXC9HH3zoG1+JGUo6+Mn58CoPrnYuS/0Lx2ATqTnSgxldtONxqVSNGuz8RW
         ONYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776813157; x=1777417957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEqeOOMJL0MyuLpaUxwclHIgWXv9VRMqv4q5M1RKiok=;
        b=cr9kNrO65TCZFEZhy63Xmh3B4DeO+EbLsut1EyouOayrZ+6c5wNBYgvr3Pvt0gj8Rx
         Ip3Rrz6QU4Wm3Bl0kxlt1Dvyt4oxbjzmacG/w3bjKrv/oFmNkVRRgQW1qKGn8EeUTsJv
         7Gy6SBBkNOrzYQSp6NSLc2hoc2j8zGTch2LR083F/1ZaFYlcydy7xYxLBCUlVBKGnMVg
         miRR4E/xy7S2OgFY12Qd7V70vlQLnfybtsR48WzJpo8Wm8TDESZ1z0P3x0ehoE041mJF
         WPNcxnWIOTjZ4Sw4h/sFPI43KAeXNznLmngfAdXHt2jGRxy8QjAQhmPN1LTAWAYOXTGJ
         RJMw==
X-Forwarded-Encrypted: i=1; AFNElJ/FptCJZXZW17DibceH4XFL2v9n5azwxcqGHYc6OD37qaGn+kClFj0U/D2ghNIUaLBHmg8/IMA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrEzEPOwlP69K4gSMCe7+Xkx605AAYZKDznji1n6SAEx5KZLDR
	jUJ3LL9XTgcRt5/FEa2BafBfeJ+VN4mv8F9pGQ0dbJU8Pm19nvoibrP2Q56u5/ihPiSGiIY+gVl
	c7sPSpetJXl+WWAkDoEY1PtnIHNYiZMM=
X-Gm-Gg: AeBDietmBf/NSXR6QhHk1EV26LFsUrL/7bImE7vVFNNQkUAETmMslgQdPue7pC3L9U0
	/Qt/ixzaqVbC1ClutTGu9F6ffKE9EFqyKbW7AVN3WahnuLXYXNNwweZLOTInPxpnqWoq5Wf5+qH
	m8r+4iyOHXDSboi2F9kWEs1KUth10O31w2OH99D9Ra0mjBapLilP44dENS3AphtWDOCZOTJTIqp
	BrB1WfrjXQ0VOneS8snqXiDTv0L5k4slZtqfEPeb6lhm1sEZAaa9r83wy2QYXY0ypgP9TfIsVkD
	JAmmGExLpQGBuC3E9QkIOHzJcDWgCv/wmQJq23IzKxjFtL+FZdOH7zQQKJHugrdwTlPbuW7wriF
	xNEFl2alOdxaPu1oTfitE9Uxc/rZOYAwKcxYFcxthqxCyIFEX
X-Received: by 2002:a17:907:3f16:b0:b9d:6d06:b78a with SMTP id
 a640c23a62f3a-ba418985765mr855604466b.17.1776813156675; Tue, 21 Apr 2026
 16:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260313001608.118294-1-rosenp@gmail.com> <ebca61af-7873-4a6a-aae7-151e81b328e5@oss.qualcomm.com>
In-Reply-To: <ebca61af-7873-4a6a-aae7-151e81b328e5@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 21 Apr 2026 16:12:25 -0700
X-Gm-Features: AQROBzBcYSBBxPxgApn-xQFzTqpKuD71x22LJW6s29Kys3ic7Z6oH4hLyooD4wY
Message-ID: <CAKxU2N--N9psvqkoHetoz+o49ipBxfTT_gP23zA5Wd4p=+nDhw@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: use kzalloc_flex
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_161238_912587_F886E2F9 
X-CRM114-Status: UNSURE (   8.53  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2026 at 4:03=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 3/12/2026 5:16 PM, Rosen Penev wrote:
> > Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> >
> > Add __counted_by to get extra runtime analysis. Move counting variable
> > assignment immediately after allocation as required by __counted_by.
>
> can you update this like you did for the ath12k patch?
Done.
>

