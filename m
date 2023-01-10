Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFFEC54EBC
	for <ath11k@archiver.kernel.org>; Tue, 10 Jan 2023 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUfFdVSsgwyZaPz2tUC+5KmwwzNHSnsJma06/Of2drE=; b=5CuI8/pGyBT0uE
	//1cTTXvwc2PKwUFYwWOSs+WshVMfyJgudPfNfeFNCZvaVPBU/18Z18m1y7IS1DvBjMYEdAH8vJ6F
	jkO7cCZ5IVEFR8XIh6Svy3DF8gcg1zyI+48alp13kUtZ34sk+JUf8EuxfrvmEzo0M97YPJDqmLyis
	fNtYMqS+YufFIcklC4L5KqoStU1LKPdlndr+Q9tnRaO/oQveLo3QfMwFA98ZK1UBreIByiEKRZVrm
	4n7otqsyEVJ7H+OJF5LhjHHeHzMlKo9a3L1vXxjH398BwHm/uwKlvnhyzm37ZxvqGNoU2fRy58efK
	ELnVZYOdcY7lRSRwgn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFI4C-007ucp-58; Tue, 10 Jan 2023 17:05:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFI48-007ucF-T0
	for ath11k@lists.infradead.org; Tue, 10 Jan 2023 17:05:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id c85so6062149pfc.8
        for <ath11k@lists.infradead.org>; Tue, 10 Jan 2023 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P7VqYujN76bTRmrMaoEIHiHeEhQrUIdz6GC94wtp4J8=;
        b=oakdv63xlZhd+vcuUCU8xc0JKkQZ3pIx+6U4d3EjnHUwJSmH087Wffbk5LRMaRk1Gr
         P1oSg6d1Z5T2acqHnD1VgEWJprQPK+fmjFEK5H4uaVgpX2wBEo5OPvJwZ+zopI2DiRTL
         pkhw6NSvcs+pkqb0g2VVaPI/dQdqIfgiMtnz9Mvt7ANEVQO++yRpd5Mo/b1W2uNwzCPv
         4JRDleHMpUSbDdwm6gpGhvp6oGvkxEYOtdiWCYPGFyEmgvb1li794YYirYKKUw/6MTMy
         UXyWmbsyyK7dKWPq4iVQkwbQn2wGvrkr4FQIovTMTLrtpJUjUPcTXa5gzdH4EELuL3SB
         vQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7VqYujN76bTRmrMaoEIHiHeEhQrUIdz6GC94wtp4J8=;
        b=W9wTeWGgVLmdtYmEMTVL+cUl1OdkuNG/DZjZgL7ByQvq0cWyk/mwoqFQo6GKo9TMQa
         8tjJOWErTv0av1uXPh2yKdSOBa9mEaPJ4ARqS65vA6eRLtuhwlzm1YekeXPzGHfFcJCy
         QmSKZuCRYna5cP/eTNIP4G6O3LttverbO7erKARlFSZNzagLkFeJdfxSxAf0dccKq4XM
         gWox3YvrVz3XEKUSWYeBNoWXvFBeSbQ7Tu9OOSBBcdOr0Yjeb86TG64dypQHVLo6qAQq
         24lkUUOaK4X2ljtrqLrKuZufYhZZnB6TNBDT2CCPOtVcvCes+lF/PwW/eLuWQdj65EJC
         kdXA==
X-Gm-Message-State: AFqh2kqpuhF/44Fesr35Ggjdm1TVSvPWqRnbEMEJ9yLxejk5qo6+ykVy
	QyJDQ4GUZqYZDDZV44/xfmcgFOlSq+4=
X-Google-Smtp-Source: AMrXdXs+VL0xrwwY1lY317Ko3FUXiqiprqFoQCSiYZmoRgaKA/w5pnLHFlxCog/EiNC00Wdzw/mU8A==
X-Received: by 2002:aa7:8209:0:b0:581:3328:b468 with SMTP id k9-20020aa78209000000b005813328b468mr48635107pfi.6.1673370331500;
        Tue, 10 Jan 2023 09:05:31 -0800 (PST)
Received: from [192.168.254.20] ([50.39.160.234])
        by smtp.gmail.com with ESMTPSA id i8-20020a056a00004800b00576145a9bd0sm8302689pfk.127.2023.01.10.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:05:31 -0800 (PST)
Message-ID: <0e7644cbfa9e4ba0d534681166ca467ea1684719.camel@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
From: James Prestwood <prestwoj@gmail.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, Marcel Holtmann
	 <marcel@holtmann.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Tue, 10 Jan 2023 09:05:30 -0800
In-Reply-To: <0b06dea9-d5be-1edc-62ca-576398d1bcd8@quicinc.com>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
	 <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
	 <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
	 <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
	 <0b06dea9-d5be-1edc-62ca-576398d1bcd8@quicinc.com>
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_090536_970838_7EC06D9F 
X-CRM114-Status: GOOD (  26.21  )
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

On Tue, 2023-01-10 at 10:49 +0530, Manikanta Pubbisetty wrote:
> On 12/29/2022 2:52 AM, James Prestwood wrote:
> > Hi Manikanta,
> > > By the way, userspace itself selects the frequencies to scan, not
> > > the
> > > driver.
> > > 
> > > If we see the split scan implementation in cfg80211, this is the
> > > how
> > > it
> > > is implemented. If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set, it
> > > selects
> > > all PSC channels and those non-PSC channels where RNR IE
> > > information
> > > is
> > > found in the legacy scan results. If this flag is not set, all
> > > channels
> > > in 6 GHz are included in the scan freq list. It is upto userspace
> > > to
> > > decide what it wants.
> > 
> > 
> > This isn't your problem, but it needs to be said:
> > 
> > The nl80211 docs need and update to reflect this behavior (or
> > remove
> > the PSC logic). IMO this is really weird that the kernel selects
> > PSC's
> > based on the co-located flag. The docs don't describe this behavior
> > and
> > the flag's name is misleading (its not
> > SCAN_FLAG_COLOCATED_AND_PSC_6GHZ) :)
> > 
> 
> Sorry for the late reply, I was on vacation.
> 
> What you said make sense. The existing flag should not add PSC
> channels 
> according to the flag description.
> 
> We can add another flag something like you pointed out 
> SCAN_FLAG_COLOCATED_AND_PSC_6GHZ and include PSC channels if this
> flag 
> is set. What do you say?

I'm no authority here, just wanted to point this out. This is something
that would need to be in mac80211 though, not just a specific driver.
It would be up to the maintainers and would require changing the
behavior of the existing flag, which then changes behavior in
wpa_supplicant/hostapd. So its somewhat intrusive.

But personally I'd be for it. And just require userspace include PSC's
like any other channels if they need those.

Thanks,
James



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
