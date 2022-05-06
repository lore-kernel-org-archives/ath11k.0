Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB5C433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebaeMbkTZeB2Y85sLb9XIgkOunnNFqCYiOUjXFv6S2M=; b=OfAUV2BlMnzANVJHOShPUrlnBN
	ZU37x6TN6+CzX13IACEGyI+vsiQcbmUGar0YRNriz49DU7u0GaDvyTpOP1RuhjZtYcEVLae7+/hyh
	l2pnufkWNkUgO/Lr/Fv29Ao1WPugsYGipYwjmnTa2DxNq7mPoa/vYROvLz98ckt1y68ePlDfgxHhk
	0w4s39o44EE5R113pPoiIH4+6gpm1U4QxW05P2FJfwZCYXcLvCEV38B+YDlmyr1yeoYeX1852Jf+y
	7dpphUJmYmG6C4beaQRWFbO5k/AXdzQwOQCiB+kEJg6nwhTvTcr03DELvMLMWMf32SjK0vmSzJXz3
	XekYSPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmujJ-002aQx-FN; Fri, 06 May 2022 09:58:33 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmujF-002aOA-Tr
 for ath11k@lists.infradead.org; Fri, 06 May 2022 09:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831109; x=1683367109;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kLPj1+RpZMYVFcLfswJIQkewFyywkrnzKyBpKlknTqU=;
 b=lbuTiiA2/tzypDcQIV5117eCa5sERuFq6kdS+Gmc9uPPAsTmq68qrXhr
 YHaNhe9qo530RmptPQWO/F7DPDFrHp6xU23o4meutv5nA2FUYXoJSzezQ
 wA1jLh5LM5xOmQsGVxM3Ob4AGpO6Ci815pYHpGfdp7+NXeKBnrfgdu1Te
 kkCit5fGcm77YdejYbhIzz1grOM2AYkmqc2W5A62BN+1AWIQj+r8lFnAB
 xp70VEGztir1MubHeVyGlH8aXp4+LBAZ5dhb/NmAdeo6RzMCj88s8TzZx
 lUBRuT0QpiQtkZ7LNhLPXbz/0ngmsBmIxVVg2penTzUQP10inTcPhGNQh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268317778"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268317778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 02:58:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585900309"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.170.35])
 ([10.249.170.35])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 02:58:24 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
To: Kalle Valo <kvalo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Carl Huang <quic_cjhuang@quicinc.com>, lkp@intel.com,
 kbuild@lists.01.org, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
References: <202205032236.kofEquX3-lkp@intel.com> <o5hh7658dxr.fsf@quicinc.com>
 <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
 <20220505055817.GQ4031@kadam> <8735hn9hfw.fsf@kernel.org>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <e8b3efec-dcf9-0ab8-e2a9-b2a514a14d49@intel.com>
Date: Fri, 6 May 2022 17:58:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8735hn9hfw.fsf@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_025830_108996_B61E20EB 
X-CRM114-Status: GOOD (  25.45  )
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



On 5/6/2022 4:46 PM, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
>> On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
>>> Hi Kalle,
>>>
>>> Is the below the same fix that you have already applied to ath.git?
>>>
>>> [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() -
>>> Patchwork (kernel.org)
>>> <https://patchwork.kernel.org/project/linux-wireless/patch/20220408030912.3087293-1-yangyingliang@huawei.com/
>>>>
>>
>> That looks good.  It's sort of annoying for me to send a bug report a
>> month after the fix has been applied...  Sorry about that.
> 
> My ath.git tree is not included in linux-wireless builds so there's also
> a delay before linux-next sees the fix.

Hi,

Sorry for the overdue report , we'll take a look to prevent the same
problem arising again.

> 
>> 1) These are kbuild warnings.  The zero day bot generates the
>> warnings and I look them over and hit send.  I don't know why the kbuild
>> bot seems to get confused by -mm.  The subject says 408/8237 which is
>> pretty crazy.  Maybe I should just ignore the -mm patches?
> 
> Yeah, I have been also wondering about using -mm for ath11k reports.
> Does anyone know why that's happening?

We don't have a filter to ignore some warnings from specific branches,
we can create one to only report ath11k issues if found in ath.git,
please remind me if there are other rules.

> 
>> 2) The blamed patch came from a git tree but it had a Link tag to
>> lore.kernel.org so we could have used that as an In-Reply-to tag.
>> In an ideal world, all the bug reports for a patch would go to a
>> standard location.
>>
>> Link:
>> https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhuang@quicinc.com
> 
> Yeah, that would be nice.

We have already linked the bug reports to the patch if the patch hasn't
been applied, I'm not sure is it possible to find the link of patch if
it's already applied in a branch.

> 
>> 3) Another idea is that the kbuild bot could search lore for Fixes to
>> the original commit and include links to those threads?
> 
> Yeah. Also searching for all references to the commit id from git log
> would be nice.
> 

Yes, It could avoid such false positive, we'll give it a try.

Best Regards,
Rong Chen

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
