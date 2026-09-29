Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0772CCA5FAD
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=; b=Qv27zYVhMDWBuZT8a9sDyVozV2
	jstX/Sp5auGdPSjJ41bpQ5sccc+Z9DmXtJy/Pn2sfmwhh4NNwTswedHSzV+rADiyMO7FF/DZ+p4uL
	k1qo/hbFKOzJiYK2lNktGbcuHzdXp8dxWakmz/Z1lWZ7AlBw69abXmYIz1X8toS+cA23RN4xsm4uj
	JimxHNLXdxbW6lSvRKGjhAmYQS9d+pFXh34MVTOtHlRmjGU0XIFcEPy3u5th4Dp6NC7wdhcFbsEvN
	mRIeq/pmibCvxHo45DQAgWy0ZZUBiAj+gTk635fHmKz8R1WQtwAIF9pNVZoX+W9vb1wbRcp8qF6s4
	ZrqNuxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbUC-00000004Adv-2Omu;
	Tue, 29 Sep 2026 17:19:24 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbU9-00000004Ad3-2cwl
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 17:19:22 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f7so20280515ad.1
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 10:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702360; cv=none;
        d=google.com; s=arc-20260327;
        b=asgvStaIePxELjZ6kGGObqhZbnzA4aB/XWRmsVwO74V+ZeQYAv9ZV0biuq3mxNDlML
         hrt6WeEPNw1hOpATOqxhu/DNganJW3mXyGG6yuoOAVjq7V2/uJ3rOmIWECbQFOu0jbfG
         8RV7rKdWTwIQ/X9NXam/MFR/e7R1qmLScFeJufXEMqir+oWYac+3IwlbG/b89BTtDmVf
         qY0xE0nRXnXQyX5dVgKl9q+1TRxBNTRUPMcYUnGDekSFJHFG7JEkt0iPUU1ZI/WqjLdm
         +XvGnoCyUCbimowGobxc8dpQCJmlchflwB5W/hZHsMUUC5XYjodjnqdJv5azuXJx6VIf
         79Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        fh=sSdq8AcXu8EledV2/deKZqvaThMwKnMlkAnobJGdyyo=;
        b=LYgiLCTZ+Nrlpr488hkL+WotOnlGwKnOiDO/ZFk/cA/KqtnffapHgFSuLjDnLZMeFF
         4r8Z54gVQXCrW5kfHMUuON5CsOin4BlOvbwCsO0qIqjHSqSowC1pLAWOLrgdgbR0wwkm
         V5hEta2WE2wergcg790/aW2THaDDxoKkrTG7E09RVD5ZH9b8KlYAIiFl6ubiXwiK3LGz
         MdEv4Br7rFU78OVj3iAiR62o3LvV11Q4tw+A6tcqk0VIML5wHqB/Y1DF70LHHjk2lqwd
         NI8JpFfAh1zZZGaWUic233V+F1VWmtFoFQttaNawmly0YXUzKm/4TO16YLJrv0J2Ihal
         01FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790702360; x=1791307160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=ZfVTT+KgufmNSOZvR4XreoiC4WWqXyasnPb5flYINbvH/vBMKyAkmxb6AUFXLlGiuk
         H7OANyQb7fZUF02RvRn0/+ShUEfaPiIPIMIW4XRXufTWTDti0F01f5FuZl9kzslbySOj
         +5U/d6M3RAGhuMl9P49uhI3v+J5BdEKu5i5OsqXsBV67oaLHZpooAgN0qRLnR18Ujiku
         cRCSAu4AMQiZOJGXDF/UBDojdSeX0Wv+aRgHTk0v8mlcfBRhB3pdk3I8xth8O9R2ELG9
         YYyUTWRvAhIbGpvGdVzhqfCLTNmu3iYuzqQ/kFL3DYn77eQVzWyjNSR/q+Z8nY+kvqfw
         La6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702360; x=1791307160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLoH+W4btvpwkIbumWh1h9mdDqao5jnwEcNs8ugGZcI=;
        b=N0zPrnZ7WjJqxGHHAcPEwlwv+msJ0ulOa2csxB+fqbL32THkqFHOnUjFms6R3s7CX5
         y1JORmpAl0FNlYt+M14gqL2HDk5Oe2zaULy698SU6itQyUXoQz+gwaCIdd4rpjyzGA7h
         Tg/Av/QaMOCkcCEwDTq/4JNfjfEJz3K9vv762ZEJZ5na2aYTOjWeGag9AtjpICGFZZQd
         OMhx+/3gAlQ0M/EoBDMgtXmutdMwDNfe62GDubh9fa5D4OAC2WIdzMcRRyeteesCLOpf
         Ykva50btoZyT/LZ3AlW2OFT4vkFA+3/9oQXkhQH2i1kPZByGhn8Uj1qIXzJUDzh9Jky0
         YTCg==
X-Forwarded-Encrypted: i=1; AKwUvByz7gZ0pT01IzoFSiJz9ro501uYzZhxvjKLbKsf6iEqs5p9o9Jb5sT+U5qYHrA19KRwAfoN31U=@lists.infradead.org
X-Gm-Message-State: AFq9FYKD9l+lWtPbrVf6COqAFJf0gOKo+w7KFalBQ41LFWdI2Yy+GrcD
	bWtQVAxjZsUjeeOrbvP5XmOs6Yu3fEgSXtWURXkTl4Y5FYI5C7vTtv0UlFpPpm5BG1KMmLl8bMU
	DWEFt2TtmU4sj1DPq7N5i/bOsvZmmbYCZe3GYLdOBug==
X-Gm-Gg: AYBFou2dgjIZqO7hmumw1yw7sWTHd8a+MV7jQz5kH8VqcZL8DfGR38Tz3EIWPVlOF//
	V9Ws7s5+MuNlOmqgcZDDpTkiYW0oQKm2rdUoPFTpgxr8+D1I+bZDorGcjNgHl4pI9dCXvlW+aWL
	v/WHXPSuy1J4qhfM/O8+8Ui5t9x5IFdR6I4VM98FwgDj9c7hPQyZZZHpMRvgBZC8+iRG7ocSWYs
	eEbhdTEvLrGjFUatpkDoGTepuPgnscMEWA2XEo9+hJCqOCqjkNd/49Fbe66EskVtF9PPrir0pH+
	Ta2+8ykFguhf2qJ4CIG0bVnWgQ5U/br+/DNV7F3pmJ8vozvkRB3nABlSzMKTGxudyEozWVt+Z4e
	MQRoQ4gM3YyA1qX8b3TI3UIlhGeWrgOxyQoU=
X-Received: by 2002:a17:902:f541:b0:2dd:c0ff:e72b with SMTP id
 d9443c01a7336-2df7dff6a98mr129292205ad.61.1790702360116; Tue, 29 Sep 2026
 10:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com> <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
 <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
In-Reply-To: <05e539f8-bb7c-4038-8a83-8ab0d1a5b917@app.fastmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 29 Sep 2026 19:19:09 +0200
X-Gm-Features: AclHuK-ToRBMZLSrRMx2mcPZtu0EDHFcdsd8teCC6hGeRk6_RwlD5j4V__Nj-zA
Message-ID: <CA+HBbNGS7sVROVN3mywPJEcRKn_+FzzxkijN4Uqv0CMLP-CEJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Marcel Holtmann <marcel@holtmann.org>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101921_684959_EB8B1DEC 
X-CRM114-Status: GOOD (  22.43  )
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

On Tue, Sep 29, 2026 at 7:17=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 29, 2026, at 20:05, Marcel Holtmann wrote:
> > >> +#define QRTR_NODE_HOST_BASE 0x10000u
> > >
> > > Can it be exposed with include/uapi/linux/qrtr.h also. There are user=
 space clients like modem manager
> > > which need to calculate modified node id to distinguish same service =
from multi modem over mhi.
> > > This is same as wlan use case.
> >
> > did anybody actually looked at the proposal that Denis and I came up wi=
th. It was exactly addressing this properly.
> >
> > It seems you guys came up with some hot fix and want to run with it. Af=
ter month and month of silence and not bothering to review the proposal, yo=
u are trying to push your thing?
> >
> > If you don=E2=80=99t support userspace, your proposal is broken. Plain =
and simple.
>
> I'm still willing to submit a new version of that patchset originally by
> Denis, if the kernel devs so decide that it's the way. For example, the
> "radix tree of radix trees" approach could be replaced with a hash
> table.
>
> There was also some criticism about a layering violation in storing the
> endpoint id to mhi controller. However, maybe that could be reduced by
> providing a correct abstraction around it, so that other code doesn't
> touch the mhi controller structure directly.
>
> Other criticism for that patchset by Denis was its overt complexity.
> Yes, it has more lines of code changed.
>
> This dual-card setup needs to be handled somehow, either by Denis's
> patchset or by Manivannan's patchset.

I second this, as in OpenWrt we have used a hack that worked only with
QCN9074 via its MHI debug
register in order to support boards that use AHB+PCI radios.

Regards,
Robert
>
> BR, Juha-Matti
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

