Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6181DC433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ47s1J0GHniaHfbNWcAJx5fwSdspovYNNMLeNScx4w=; b=DKTIIQKR80uIBh
	XRvXBsc2rIjA0w6OFcP+AA64qQ+lH+7gFb3s3pUNyyRa7Wnr6DdZY2Fkfb18dko+4JJplnIFgJ2Rp
	yJyC1aXo4X880S+WEbC0Ndl//3qha9mk2DiQfC4meNWKI2kAofmSM4zsdJT4Iv9naZNgJVfizlZPV
	ScsIfyhU6FQEViXfaTBH4/9AwMxIU1pOwZb0In29Nw2F18LrkTgIhnive1002Dfg+zs+3bqe3z/l6
	FvbrT3GvNCoVpfzto0KrJtgESKWQeDcQcX0axVzjsApbGIzZppvGxMN7AN9aVPDQa/IiujoZXyn0U
	RoZus7qUb0+lKqMDkbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmtbw-002BxM-B1; Fri, 06 May 2022 08:46:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmtbt-002Bw3-I9
 for ath11k@lists.infradead.org; Fri, 06 May 2022 08:46:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65CF062068;
 Fri,  6 May 2022 08:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17117C385AA;
 Fri,  6 May 2022 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651826807;
 bh=vwZoxKLOUqg/pn43DxjuwPQIGGxmVNilMy/Pl5ZUJxI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=kavJK513EYw+ixWXwyWWRKKH+eHaM69FB01M5+EkBtWzv+oNwkLq+Lv807+hMMHIQ
 MfviBBbF3ycAusR+hiBmU7InGekxsksIK8JO9mOS35g16rGaHiO6LwcBj1XUrQ6xvD
 lGvibwbOvR66RFde6OvZb1ZIat1M7IyqxIC8Xs5anbP6e7eBoy6IksQNKZ8z3of4Wb
 k0dMpWTD6RAkNjZGtfmQ/U8SvAYUcQzZrD1MCQLEczxszcMl+cyZhh8y7NCNGtKu5b
 SWAbOyBAkiwejsIO5OIdZ3K2MPazuyecqmz4nfuKeLkp5PvXQdj61niqBITIunudG/
 AysdBFMiWBimQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Carl Huang <quic_cjhuang@quicinc.com>, lkp@intel.com, kbuild@lists.01.org,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
References: <202205032236.kofEquX3-lkp@intel.com> <o5hh7658dxr.fsf@quicinc.com>
 <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
 <20220505055817.GQ4031@kadam>
Date: Fri, 06 May 2022 11:46:43 +0300
In-Reply-To: <20220505055817.GQ4031@kadam> (Dan Carpenter's message of "Thu, 5
 May 2022 08:58:17 +0300")
Message-ID: <8735hn9hfw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_014649_676810_027CEBB8 
X-CRM114-Status: GOOD (  19.87  )
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

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
>> Hi Kalle,
>> 
>> Is the below the same fix that you have already applied to ath.git?
>> 
>> [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() -
>> Patchwork (kernel.org)
>> <https://patchwork.kernel.org/project/linux-wireless/patch/20220408030912.3087293-1-yangyingliang@huawei.com/
>> >
>
> That looks good.  It's sort of annoying for me to send a bug report a
> month after the fix has been applied...  Sorry about that.

My ath.git tree is not included in linux-wireless builds so there's also
a delay before linux-next sees the fix.

> 1) These are kbuild warnings.  The zero day bot generates the
> warnings and I look them over and hit send.  I don't know why the kbuild
> bot seems to get confused by -mm.  The subject says 408/8237 which is
> pretty crazy.  Maybe I should just ignore the -mm patches?

Yeah, I have been also wondering about using -mm for ath11k reports.
Does anyone know why that's happening?

> 2) The blamed patch came from a git tree but it had a Link tag to
> lore.kernel.org so we could have used that as an In-Reply-to tag.
> In an ideal world, all the bug reports for a patch would go to a
> standard location.
>
> Link:
> https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhuang@quicinc.com

Yeah, that would be nice.

> 3) Another idea is that the kbuild bot could search lore for Fixes to
> the original commit and include links to those threads?

Yeah. Also searching for all references to the commit id from git log
would be nice.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
