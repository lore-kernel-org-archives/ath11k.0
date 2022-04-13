Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8D2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWZ1OaYiiola2J5wP0DqcPrhaY33LUVKO7ng6z24AjQ=; b=2V5pOWMaulJXBS
	sD7qDqoiI9H3OymlDRAOf2pI/SvUMAPfcorQ+09wztvhFvAM6hHTGxzqV8Ou9Rm+e5rgxSgV4OvZw
	SdE1gJdlhXNBpONHba0xsocRlz93P2rC8t1CL9W3qQFRglVvwtmWF3f7O1N0l6AoVMw1sAHyQARj2
	Qfau4ks9/5dNqAkIWaP9E4mZ1bCD/HuYbFH645h2fcW+FpMXt6cMtXEbMz7Ws4ZYuEwcuiuGLee5S
	m/8zjIAclL5mWhMHQ7pDPLt+yD+33ySWbUQ2m01gCbyRau6T/yaWTPzYzj0e2QTurwqVrl75s2SbC
	fShBSNDNNJW0sSQnbOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYL0-0003FQ-1A; Wed, 13 Apr 2022 08:26:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYKw-0003Dr-WA
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 08:26:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F9AC617B4;
 Wed, 13 Apr 2022 08:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521F1C385A4;
 Wed, 13 Apr 2022 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649838409;
 bh=hIyq4Gb4PP99jpcAzfsg+lS1WxLFv/QJQK2V9zCys78=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=tuoEbO0Q9c5BhlgVi84ZlbkNnar9CPUcd5pC8H8r0okGZsdX0aHOU0vZFSJKcbBFj
 1BwTJHXpu6Ekvyui9U4ahgbpxhiF6+weNU7pvwJiggGX0FurezqkuHG56zaNsIw8rm
 ZVDQwd/kyTHfyn9fH3kdHlL5auKeuYe7qTK53xDUgvjYvsftQwIuw16scRz6SSvv0A
 7BF6MGg8CBCXrWvZrZpc7sM6Y8bAgg1UKAPQ17Zdvrpa0RIB6bZXEBwf0iZmeta64k
 DuKnvPulmddE+kCZujy0vPHUCe9N+dW2eIGYr8I64HoK7sFVlNpX8dgk4uHgK50aw+
 HEVz+osBFlXdA==
From: Kalle Valo <kvalo@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jouni Malinen <j@w1.fi>, Josh Boyer <jwboyer@kernel.org>,
 "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org>
 <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
 <20220302175014.GA14801@w1.fi>
 <CA+5PVA6R6F=VqAZRf=xDwGcC+cpqLY1kStkoHck53XiLURVyaw@mail.gmail.com>
 <20220304161430.GA430462@w1.fi> <s5h1qytw0rw.wl-tiwai@suse.de>
Date: Wed, 13 Apr 2022 11:26:43 +0300
In-Reply-To: <s5h1qytw0rw.wl-tiwai@suse.de> (Takashi Iwai's message of "Wed,
 23 Mar 2022 09:06:43 +0100")
Message-ID: <87h76xmlrw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_012651_150129_E92851FC 
X-CRM114-Status: GOOD (  40.17  )
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

Takashi Iwai <tiwai@suse.de> writes:

> On Fri, 04 Mar 2022 17:14:30 +0100,
> Jouni Malinen wrote:
>> 
>> On Fri, Mar 04, 2022 at 08:04:26AM -0500, Josh Boyer wrote:
>> > On Wed, Mar 2, 2022 at 12:50 PM Jouni Malinen <j@w1.fi> wrote:
>> > > Would the following in WHENCE work for you?
>> > >
>> > > Driver: ath11k - Qualcomm Technologies 802.11ax chipset support
>> > >
>> > > File: ath11k/IPQ6018/hw1.0/board-2.bin
>> > > ...
>> > > Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
>> > > Notice: ath11k/IPQ6018/hw1.0/Notice.txt
>> > 
>> > We'd have to teach copy-firmware.sh what to do with a "Notice:" key.
>> > Is there a reason "File:" wouldn't work?  The intention is to install
>> > the notices alongside the binaries, so that would accomplish it.
>> 
>> Yeah, that sounds reasonable to me. From copying/installing/distribution
>> view point, these can really be handled in the exact same way as the
>> actual firmware binaries in practice.
>> 
>> > > In other words, there would be only a single "License:" line and one
>> > > "Notice:" line for each firmware version? The license itself (i.e.,
>> > > LICENSE.QualcommAtheros_ath10k) is same for all the versions while the
>> > > set of notices (i.e., those notice.txt files) can be different based on
>> > > what is included in the particular build.
>> > 
>> > Yes, that would help.  Would you be able to adjust the existing
>> > entries for ath firmware in the same way?
>> 
>> Yes, I'll work with Kalle to update the existing ath* WLAN cases.
>> 
>> > > > > I'm still working on your other comment about notice.txt, will get back
>> > > > > on that later.
>> > >
>> > > This part about clearly identifying the files should be clear now, but
>> > > it would be good to resolve that part about the notice.txt files in
>> > > general before sending out an updated pull request.
>> > 
>> > Given these were merged in the past, perhaps I'm being overly
>> > pedantic.  If we can mark them as Files or Notices instead of
>> > Licenses, I won't hold it up.  It leaves me slightly confused why
>> > attribution files need to reference agreements with Qualcomm, splatter
>> > Confidential and Proprietary throughout the file, and reference
>> > COPYING and README in reference to GPLv2 when the BSD license was
>> > clearly chosen.  Perhaps that could be cleaned up in the future.
>> 
>> Thanks. We'll remove most of the unnecessary information from the new
>> notice.txt files and that should get rid of many of the potentially
>> confusing parts. If that cleanup leaves something confusing in place,
>> we are open to cleaning these up further in followup patches, but it
>> would be nice to be able to get the updated versions into
>> linux-firmware.git without much more additional delay and yes, this
>> would be with the File: instead of Licence: entries for the notice.txt
>> files.
>
> The problem of "File:" is that it's more or less intended to be
> installed as the firmware files themselves, i.e. they are installed in
> /lib/firmware/* that can be loaded to the kernel.  Putting such a
> random (document) file there makes me a bit nervous.
>
> We may introduce another tag to list up misc document files
> (e.g. "Doc:" or whatever)?  Distros can pick up them and put to the
> appropriate places in the package, too.

What about "Notice:" which I proposed above? To me "Doc:" sounds like an
optional file, which notice.txt files are not. That's why I prefer
"Notice:".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
