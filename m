Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E7C433B4
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 10:43:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE8660FDC
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 10:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE8660FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doVI8npmlneJLTuRYCsoF8SyKBl2W3kVot9nJlNlRxI=; b=kjDdyg1LGU4nX7WvVhhCy4T3pb
	/FR0exT5nCO5jQ+Yi3iVJ1y6OaJLl4nZu+ScvX58UABCrszQo+LzcQsCEW+sG0rj5uLNa2kTTz0Z7
	TQHb51FegVth8P/nUfEO4OLEQpy79FulC4B+mLSD6d7ETAb/nhmeizWaaQ/TuuaA298zvEvfLJ6+c
	k1NThXQuh1T9Gxg9asSqwqL5pOduAFYVYaeXID+IP2U2LySHzqMNpf7F9mztveTiMdXkfsweWlONO
	KyZbWz1Twmsiug5pFcHLuOrrCw5X6JyUwmUTAXWH9eX06Sn9KcZGKwT1yZC0eXwNVN1R3X56KOiLG
	YK1tdwWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljg9J-000CT2-1p; Thu, 20 May 2021 10:43:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljg9F-000CSc-FJ
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 10:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IW04GkrcNnLMAgZe3Aeh8iweN6/3sTprJybql0T99eU=; b=0xkn3r/FYtcjWgvh+eWMaQvSy8
 v5wdy6135TipoGlU5z6V3GUaXi8MrqLX2PB6aI4j/M7KmsXp+j/pcjQPBE1r6AUEqL/n8F6WLCDAY
 H3iMQzGks8WOnTTQ9Z/34+UO5rs0dr/iAdQt45yR0LOUCysH7+j61fd3N5BE6zTZPCF/Wf3aU35gw
 rps7EJHxzUHT3XyK6w8Zh/UE/C2JzQntdwhe+yLe5WD/+zzBWlxUBaN2F++Uoz7FyMDZFsjEI8XeY
 y9CIa0y1MH3o5M9DchDm91Wnv2KB+LgyQ7vklsOOUXukyfJA+uhIfArmYTVyFo0GSNUfSrNcOxtig
 0z+gB2Rg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljg9C-00GBhc-I0
 for ath11k@lists.infradead.org; Thu, 20 May 2021 10:43:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso5072157pji.0
 for <ath11k@lists.infradead.org>; Thu, 20 May 2021 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IW04GkrcNnLMAgZe3Aeh8iweN6/3sTprJybql0T99eU=;
 b=oPEiuLTy7B21if9MS/Aqe/xhEXvdul2VHQZ2dLfRfAWSFIM/bH0erRY3bvkraCo5Qe
 xFwCGhZIorGqeMga+TcD4N0vDd8s19Mq/WS9TSnb/SC6E9VbtGx7T2DO0Q2uHtp+BlBw
 Mdgn1DuPUHcdJ93Fp3fCYD7eAGBAVr8OpGHJZqwUl29g40s8oL/mj8NLk97bcewn8DMQ
 PEgycLPlx+Yif+9LzRpMunv9EyLAtc491VkCdFn7xDa/4qM0uCbVY8f8Bd+vfh2RFSxa
 HrOg5r5+s/w8jTzF56/Hd6IlWei/Wga2VsiskbrARruT5VsCPP0l1OEgn/PMan0ER5Le
 IWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IW04GkrcNnLMAgZe3Aeh8iweN6/3sTprJybql0T99eU=;
 b=e5dJdtsOzsw5FDjfXKe9V+XYHsnpmC7uVL6wkeE2JxD4cZsbhgihzl1hjWC/D7GpiA
 930mhtA6vadT4z0iHGMdiykUKcs+7PzKntwQ1BAi1wuD6yV3w/20xg2CrPwwaeVTnl5y
 +el63moZKVP3LnB08K9VwxA9D3SCgmcWJICz6A2dgv0udoG4cR5arrXvrwEAwiDQSoff
 j7fEwVejqqUZQsTn3U+03El1kXJkXUxb2Xlnrdy/Rat2HxTNHKBebx6d21fO7fNyPu30
 f+ALWY45FU5fW25dj5SCUUuKl0HcFVULmzFkRLoLHJNXLgvIrVNx6EsMmi08VmcAOfOo
 Caaw==
X-Gm-Message-State: AOAM533OxNUeuNqUqljAF6aki7JMGSSgcTuSh6e4yhXRYM6KnhkMW8k+
 Rr7Wfp6ZWaP7PIJuP2AxyNZg
X-Google-Smtp-Source: ABdhPJz64/pJD46QBHy45o4IwFLczk2gwoYOT2rXejR2w6Qbb29ZLdjhx5buftHryFa22aCeRIfe3Q==
X-Received: by 2002:a17:902:cec3:b029:f6:276b:a2b1 with SMTP id
 d3-20020a170902cec3b02900f6276ba2b1mr1650782plg.71.1621507400944; 
 Thu, 20 May 2021 03:43:20 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d8e:dcde:240f:c67:6200:7740])
 by smtp.gmail.com with ESMTPSA id t133sm1928425pgb.0.2021.05.20.03.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 03:43:20 -0700 (PDT)
Date: Thu, 20 May 2021 16:13:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <20210520104313.GA128703@thinkpad>
References: <87v97dhh2u.fsf@codeaurora.org>
 <YKYzwBJNTy4Czd1A@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKYzwBJNTy4Czd1A@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_034322_648397_14EF0F1C 
X-CRM114-Status: GOOD (  17.27  )
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

On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
> On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> > Hi,
> > 
> > I got several reports that this mhi commit broke ath11k in v5.12.3:
> > 
> > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Date:   Wed Feb 24 15:23:04 2021 -0800
> > 
> >     bus: mhi: core: Process execution environment changes serially
> >     
> >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> > 
> > Here are the reports:
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=213055
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=212187
> > 
> > https://bugs.archlinux.org/task/70849?project=1&string=linux
> > 
> > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> > have not tested v5.12.3 myself. Can someone revert this commit in the
> > stable release so that people get their wifi working again, please?
> 
> How does the mhi bus code relate to a ath11k driver?  What bus is that
> on?
> 

MHI is the transport used by the ath11k driver to work with the WLAN devices
over PCIe.

Regarding the bug, I'd suggest to wait for Bhaumik (the author of 29b9829718c5)
to comment on the possible commit which needs backporting from mainline.

Thanks,
Mani

> This seems odd...
> 
> greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
