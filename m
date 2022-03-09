Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC6C433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Mar 2022 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXYdB36HEEgDTznEOLhA4z8apZB3Zdwc87zQ3LPxfo4=; b=OC8eJRBEihM+OX
	s7cm1pqjSyU0HSr5cjOZrBEWLGU4LVX4iM5IywKGwp1eA/Km2rmHM4O+tGb6F7lY47hgDlTiYp1oI
	os8JsYqFFIt+kYEa/A/MR1PdgKemO9ST1Z43Yf3hWT2w1iqkSABWdh+xzR6uaLyLrzuHhvcVs1SQo
	ctdJ8OXNrpBlNvEtA3ZtXUkARWxRCy03te+GlohcQOr8vNeFL+pumtBhL8B3z4FFRkXB10RYQIPXT
	3bgfJaW6gWpKZGgCUatoVPbRh2l+J4eQ0OxSNytUqcq0JRmH8rr78GclADmgYTAI2gtE4IvlqHAC4
	0qi6a/6rF4BUgHrSFyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRwcM-008nxK-DE; Wed, 09 Mar 2022 13:44:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRwcH-008nw7-LS; Wed, 09 Mar 2022 13:44:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D9DEB81D86;
 Wed,  9 Mar 2022 13:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4953C340E8;
 Wed,  9 Mar 2022 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646833475;
 bh=pl1KHIlT6GwiOI215OcZKClk++sM4YBz+P+rfeVAvxk=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=MJP+xLoHJIUJPsWool9cBFcTv++AQxXh2dZS7XuwTOJMldLIGJUCzM9J1wxpfFoL0
 Dlmwjdu67nNXPWM6ogRDGE6mFBtZ5a3XEOyShh9mmeGbSpg5d8IKxgYkVi4ywDhUy8
 s2vfDfcex6NHReTV0CxHjhXQrp4RpTLZCpMcKwnnn9T9XHFJ3/tKNWji+/iYhxtzzC
 akgUN0Pg2WLB55wsShQDC/VgROzy6LyZ9MJhNqLwuptiFGRisxhUuj72/hu3WgCpa5
 zPRbx82jeozJcMLj5BsSMyxhx/DWAF+UkZQSgb6aObbI0O/ilRLERGLZ+2xLo67Dgc
 wdBSbz9LAzR9Q==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath10k & ath11k firmware 20220307
References: <BYAPR02MB4567574A7FBBA13037C4283692089@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
Date: Wed, 09 Mar 2022 15:44:27 +0200
In-Reply-To: <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
 (Josh Boyer's message of "Wed, 9 Mar 2022 07:28:25 -0500")
Message-ID: <875yons0jo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_054437_885499_001A52A6 
X-CRM114-Status: GOOD (  15.68  )
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

Josh Boyer <jwboyer@kernel.org> writes:

> On Mon, Mar 7, 2022 at 12:37 PM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>
>> Hi,
>>
>> Here is a small pull request to use "File:" on all ath10k and ath11k notice.txt files and add support for
>> WCN6855 hw2.0 and hw2.1 hardware families. Please let me know if there are any problems.
>>
>> Kalle
>>
>> The following changes since commit f011ccb490f952ea35e9ce4d73ca9b7d0d2453c3:
>>
>>   linux-firmware: add firmware for MT7986 (2022-03-04 08:43:26 -0500)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220307
>>
>> for you to fetch changes up to e8bc0db413b4ab7f8e540ffa17991ff61252de9c:
>>
>>   ath11k: add links for WCN6855 hw2.1 (2022-03-07 19:18:22 +0200)
>>
>> ----------------------------------------------------------------
>> Kalle Valo (4):
>>       ath10k/ath11k: mark notice.txt as "File:"
>>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>>       ath11k: WCN6855 hw2.0: add WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>       ath11k: add links for WCN6855 hw2.1
>
> Pulled and pushed out.  Thank you for working with me on this.

Great, thanks for pulling!

Next I need to get the rest of notice.txt files cleaned up and then I'll
send a second pull request with updates and new firmwares. But that will
take some time, it's a tedious process.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
