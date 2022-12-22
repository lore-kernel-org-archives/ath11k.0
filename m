Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41062C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dM2ZnAOvMh86wwtScTDftqxNvWcnTSxQZpvhXFwmlDg=; b=cRJEWZ8qGHphjL
	6g0dmGKrUtQLD8TaGWCanpYkefGBMU8Em/uFoULZhxfJe53WBFN9PbYaQ3WqotHuG35CLwrNapPtE
	EYZAv8hY8bHmagfHFaExhqa2IdQV6+DJ6D+YF3bAsSgLbAx35fGUnsdqIbHTp1izSokkNtrDqmx1x
	1i/BdkTedY+fCQl3XYte3M/hDQ+WMF+DcQDq5xJQ+RMzsB0f+O0+ByJAM7A0cikBw+Os8eJW9IqEx
	OOOR+Dafl2+HLP7HeX/LA1ikKNZmVyw2bAoWu3lgWHJEqx/WR0O8PXm51RzGSZ+A7WQj3sb5DsBXK
	xNK+wZQ/S2xXgskU4AWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8OOZ-00E2Re-0G; Thu, 22 Dec 2022 16:26:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8OBv-00DuSA-1M
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 16:13:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d7so2431064pll.9
        for <ath11k@lists.infradead.org>; Thu, 22 Dec 2022 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9uXNAtYOJaSAVj8GIAOcJQJhRtdrN5F+vlXiT7Hfv2g=;
        b=mDQ05lSeOPHwSmB2OQRRHdm65XcK/R0vRPyGkwr1KymHAzAXrhggUE9fJh2UwIobQ6
         evhHBagwzNUmHCp1Q3reHhyNeF3/6unIBwXajG3gdD8Ni+PaODK18/wgu7dJIhYZVt+v
         W0sZ8MHdnj06OMrsztpJ7wtSzjvDe/EWF8rthVfCPQVtSX8VjCON1+M8hB9klCouBBYz
         oXUzmkVdQKeezWYwtX34/kvRJB2uen5sVWPjgBU/f+EfO/hJKNpZUhcNRcfPeMK1xL4g
         H6wOaDhj/x0YgpUaUe1sS4m0d9P//V3l/IQ1bBCvxRE7xr0MJt9/9bo2bUc3Ct+RQuLd
         7UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uXNAtYOJaSAVj8GIAOcJQJhRtdrN5F+vlXiT7Hfv2g=;
        b=uTae4wUGzCYsKoOqEooJsLrGwfvXqI/purLQyfdsN0KDTzE93dL7hPBuKii5RCldtb
         MpykhcVpg/3rGwXl4o8WezGJ496YkOFep2R2WwDpWTaVPfBufL4aSQkz99d7SH5lnSC8
         UQ4uxFGH15DPyiP7jFakMYoUu6Jx/lHpsPuDFjto/feGvsN496JhNFeQ+tvT1hCaptQl
         cZxDhM533NzLUKFtZFIdzC3kKN7nSAFuDgQdrIjzhA09oe5G8DnRBDtZzvoWjAFp/dlY
         HEtdDbPm4oOtrAHR13u3tSRP3/LLUJTmB/TW6FmI1Ix+X+j7KYRrEx/X0EsJJDy+/aoy
         aQYg==
X-Gm-Message-State: AFqh2koyyX3fymO1VAsjxn1t6FZu8pW7bnwPLqha+9DfXw4lUHDR9X1y
	uUdaoRG9EK2iomL+uuJMIRK6sXPk5eDF8b5Qe7E=
X-Google-Smtp-Source: AMrXdXs/FMZfzNV1KLet70sMpoG21tJj/qea+qbe/DN5br24FzinN4nMoT2doxX2nF5kL9/09clAdZLMhyyoH+l0oDU=
X-Received: by 2002:a17:903:2301:b0:192:55ab:890c with SMTP id
 d1-20020a170903230100b0019255ab890cmr143738plh.57.1671725583098; Thu, 22 Dec
 2022 08:13:03 -0800 (PST)
MIME-Version: 1.0
References: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
 <87o7rvzgpn.fsf@kernel.org>
In-Reply-To: <87o7rvzgpn.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 22 Dec 2022 17:12:51 +0100
Message-ID: <CAOX2RU6oieaGjpPpYwnMtBk=-nG13=JGW+-+838REQ4HsPcRNg@mail.gmail.com>
Subject: Re: regdb.bin availability
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_081307_146306_C4993395 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, 22 Dec 2022 at 14:54, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > Would it be possible to make the regdb.bin publicly available?
> >
> > Newer FW-s support using it as the external regulatory database and it
> > would really allow the community running AHB radios to avoid being
> > stuck with the outdated or even non-existent regulatory data in the
> > BDF.
>
> I thought we were providing that for all hardware, I guess that was
> missed. Would you mind reporting this to bugzilla? That way it's easier
> for me to track.

Currently, its available only for WCN6855.

Sure, bug opened:
https://bugzilla.kernel.org/show_bug.cgi?id=216832

Regards,
Robert
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
