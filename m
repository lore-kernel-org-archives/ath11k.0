Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1969DC636D4
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 16:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6TyMVcz1+KWNPn3Ib/YLtNDm4DSN8fBGGhJ7GWz6XA=; b=nzY0zAdlnX9oRB
	V2pO2ke1k06Un7325QkrdqCpuBmQm/vwpk+CwOg3XdA/gqJx8pXVHFgq8MvPPZUZZuHRXezoHKyM/
	s9Ac0xP/OdDk5B1m5LKeNY8LAtXjzRzG7f8Bc3T7oI3HeTxd+VF4IF/bZPVua4E4XCSLJ71pCRwLH
	HaQznNDx3UlhC/uqlutdIQmSUFBdTvPrPlxXf9oHSu2MWqhiTUTVTm7gunRmI2m8oGAMp96jx9aIS
	suqzvyGI5q+CzpZTwyDZLexYgiMYLz0fRm8mKy0LC4reI9z+a1h0fkEAS43g8O0P32TycygZxvx3v
	qdn9vcn/vfl2fNPo3LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSL6T-006asB-ST; Wed, 15 Feb 2023 16:57:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSL6Q-006aqv-Sr
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 16:57:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 733D661CDE;
	Wed, 15 Feb 2023 16:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEAAC433D2;
	Wed, 15 Feb 2023 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676480273;
	bh=pZYngPe4e773XbJzeeYSvB5/vkb/xhwvgUaG89tXrRQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZWsYfnvAPD5WNVOl0t89Mz0uR+AeKy5lpK2S3+tNQ8j3O8DEjmjUl6bkq6+arFU0H
	 VzEH4RgGFRmQKBZKfJX8Yp8tkesbPanBzEc95FW2Vx0Qp4Wq+OsAahVHTGqc9R0Dh3
	 o+1WaqbEqQgS+5R7iMjIpJP66h272Ydpv9CcNUFBaKLnVohx0Vv6ik37Q2TxxhXkUy
	 9KGwAD1B7LJTQ2TZFlQzTHRYlSM3V2IQQFLaW4WPXB5sDuoGoJTfGSZR0Axqs08+c5
	 24BrQYs/7KTkrVOq/WC8iLu8KcNuUDIoY9Gk2H5atoz2CL+dCpb1adZYOzDNfDdZII
	 5VPOTX6Qa5Jkg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Robert Marko <robimarko@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: regdb.bin availability
References: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
	<87o7rvzgpn.fsf@kernel.org>
	<CAOX2RU6oieaGjpPpYwnMtBk=-nG13=JGW+-+838REQ4HsPcRNg@mail.gmail.com>
	<CA+HBbNGCKvP=qTRm32Pkq+CHX5k8BB0qjahX_ppmegNyu_k1Jg@mail.gmail.com>
Date: Wed, 15 Feb 2023 18:57:48 +0200
In-Reply-To: <CA+HBbNGCKvP=qTRm32Pkq+CHX5k8BB0qjahX_ppmegNyu_k1Jg@mail.gmail.com>
	(Robert Marko's message of "Tue, 7 Feb 2023 12:39:31 +0100")
Message-ID: <87lekyuar7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_085754_988519_B7337E75 
X-CRM114-Status: GOOD (  18.76  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On Thu, Dec 22, 2022 at 5:26 PM Robert Marko <robimarko@gmail.com> wrote:
>>
>> On Thu, 22 Dec 2022 at 14:54, Kalle Valo <kvalo@kernel.org> wrote:
>> >
>> > Robert Marko <robimarko@gmail.com> writes:
>> >
>> > > Would it be possible to make the regdb.bin publicly available?
>> > >
>> > > Newer FW-s support using it as the external regulatory database and it
>> > > would really allow the community running AHB radios to avoid being
>> > > stuck with the outdated or even non-existent regulatory data in the
>> > > BDF.
>> >
>> > I thought we were providing that for all hardware, I guess that was
>> > missed. Would you mind reporting this to bugzilla? That way it's easier
>> > for me to track.
>>
>> Currently, its available only for WCN6855.
>>
>> Sure, bug opened:
>> https://bugzilla.kernel.org/show_bug.cgi?id=216832
>
> Kalle, can you please look into this? It's currently completely
> blocking the community from using 2.7 FW on IPQ8074.

Sorry for the delay. Yes, I will definitely look into it and will get
back to you via bugzilla.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
