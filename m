Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B1C43334
	for <ath11k@archiver.kernel.org>; Tue, 12 Jul 2022 02:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yISPj6ZcBq7WLJWqg89E3estjVLya7AEcRlhAI7tn24=; b=gpVSG46PZUgk3s
	ZvB1bJ15m5+s49CF+xoIsKYZT2/LP/J4z/oAupRE34/bWf9zQPPnAWX3mSsrNQsLcG6vqQyvS1XHe
	oXcRnM5CJTjXwlQqoGEUXQFyTnWPUMQBiX2jSoUqYaNu0GCOupTiaQiofco3qIZjH8HbB2NilD/OT
	WM33h5uddYF+mrmY3CFcmnRHsQMwnqXku2FMDhfmKrb2uAbGbEtf4BMhOKZN6CRHE7jgB+24Sehef
	3140Sm/pgrUFwG2skctNk2alFo0xNEs7LkvFmw9baFnTr6dmQWYcgcDHRZooou8y8T+yIkHb12WIN
	8ewlGsur2RWGzZr9zSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5qm-006n6F-UH; Tue, 12 Jul 2022 02:42:12 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5qk-006n1k-Lq
	for ath11k@lists.infradead.org; Tue, 12 Jul 2022 02:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657593730; x=1689129730;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tOTRgaHK1vo51e3asPD1Ueq4NEQvEQIHawc4FbSjEKE=;
  b=fgTkLKHlZ7XPsyXCuVQGtH7HzXhHGgmQAa2j/FCoDFFlXhVfjtFZwlM5
   YP2iPn+PNFtup1uJmXCCQILlp/jr+0awfKk8AC+YZ1q72YImFTfTEZrbQ
   lbiiiPgCWECSOOSaH+aT5+JemvCuIcsVgKygTUZ8e04LzO8Mawz3OCCfw
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Jul 2022 19:42:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 19:42:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 19:42:00 -0700
Received: from [10.253.38.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 19:41:59 -0700
Message-ID: <07ad1a63-a922-aff6-75f1-4e66617602e0@quicinc.com>
Date: Tue, 12 Jul 2022 10:41:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v2] ath11k: fix blocked for more than 120 seconds caused by
 reg update
Content-Language: en-US
To: Abhishek Kumar <kuabhs@chromium.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220701072855.13655-1-quic_wgong@quicinc.com>
 <CACTWRwvispWNXAPGdUvAeRgLvUgFgb45+JTaOVX18mvhyQsQkA@mail.gmail.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <CACTWRwvispWNXAPGdUvAeRgLvUgFgb45+JTaOVX18mvhyQsQkA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_194210_785210_9AECC883 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 7/12/2022 1:54 AM, Abhishek Kumar wrote:
> This change will make the device come out of deadlock on rtnl_lock if
> that happens. Did you think of ways to completely avoid the race
> situation to occur ?
>
> Thanks
> Abhishek

You can see the commit log, if to completely avoid the race situation to 
occur,

then it need to change the rtnl_lock usage in many place in 
cfg80211/mac80211.

it will effect a lot things.


It has a change as below to reduce usage of rtnl_lock, but it does not 
remove the rtnl_lock in ath11k.

cfg80211: avoid holding the RTNL when calling the driver

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k/reg.c?id=a05829a7222e9d10c416dd2dbbf3929fe6646b89

>
> On Fri, Jul 1, 2022 at 12:29 AM Wen Gong <quic_wgong@quicinc.com> wrote:
...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
