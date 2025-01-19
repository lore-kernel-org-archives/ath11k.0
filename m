Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6501AC02185
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 00:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BOzZKmL8ZI+fceofBNwktY/tVagVG1zjtXb36neCH0=; b=yEAW1AxFzpq6uwxYAXGDYN8E40
	h2BkE/97100eLidqNlQ2PA1aG+wVB3VrIEbhT85iuds2AFjd/ePVWYD7Z4bYjRyFngN+sYLzk4JB5
	oXVcRSVwnx9Rie5flcbbEaKdEFF2irtxmS+0SfQ83v1hg+CeqAZlIZ7xfzdbd+NhThsWzdvKhddmk
	x6ZGm6o381gl3/UnOb5I7ncmy4hr9NE1Qp2swaNPwU/OHulxkIXG6OHspAFnNRZt9++CJEF/Jd+ut
	/X+Lr8sPFex8ML4CaQbZuFSovpfHYUGHGmVM75YV4MsJvlfTZ8tbIxATylY/exdUt5eWnCX0yroT7
	bAfZFHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJbT-000000038Ji-0UPK;
	Sun, 19 Jan 2025 00:55:51 +0000
Received: from dd54106.kasserver.com ([85.13.166.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJbP-000000038GD-1Q29
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 00:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen-moser.de;
	s=kas202408292216; t=1737248131;
	bh=8BOzZKmL8ZI+fceofBNwktY/tVagVG1zjtXb36neCH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yy/3JrUyv7QCVFWACNI03JU6bCnTaC2XjqTru4nNNY39jvr3terFKD6MlTEpcwLBB
	 khMJGnlV7pGc6+yf2balK+Lv9aXsnA9X1CznCdKMCNGKjYWrPUtym3q4fboj65/6cH
	 d7rCOWO02CHBzurqSgyiWDEhtrUBFzt6a5xp3uQnqike6kOPY98lD8Ma7Lcqw1AdQ0
	 YXLuX3DdKLdIpsB8KiW0q6WjUduf6O9bqVYb3IbjBvIeX/ktkPLAhf6QwPXqDXLFIN
	 jSaC87x9OCvD1YyF7EheRiZ74NYvxXhohgIAHkYuAPQ+A84W/CR+T/f/bO6g2ytom4
	 1Iwxz998YqNcg==
Received: from [192.168.1.101] (p54a37daa.dip0.t-ipconnect.de [84.163.125.170])
	by dd54106.kasserver.com (Postfix) with ESMTPSA id C5A3AE4A4EC7;
	Sun, 19 Jan 2025 01:55:31 +0100 (CET)
Message-ID: <a996f6bc-622f-4bf7-9c7a-84a1df504474@steffen-moser.de>
Date: Sun, 19 Jan 2025 01:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k with
 IPQ8072A (QCN5024/QCN5054)
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
 <Z2Q9POuV-6MIdzRf@pilgrim>
 <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
 <D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com> <878qrkdsr7.fsf@kernel.org>
 <D74L8O64EGM3.2CXM7VKQA8O92@gmail.com>
Content-Language: de-DE
From: Steffen Moser <lists@steffen-moser.de>
In-Reply-To: <D74L8O64EGM3.2CXM7VKQA8O92@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_165547_822254_56C02FAF 
X-CRM114-Status: GOOD (  19.08  )
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

Hi,

I’m not a kernel developer myself, but from a formal perspective, it 
looks good to me. Unfortunately, I don't really know what the patch was 
for originally. Maybe reverting it brakes something.

Best regards,
Steffen


On 17.01.25 8:17 PM, Nicolas Escande wrote:
> On Thu Jan 9, 2025 at 2:25 PM CET, Kalle Valo wrote:
>> "Nicolas Escande" <nico.escande@gmail.com> writes:
>>
>> > On Sat Dec 28, 2024 at 11:13 AM CET, Steffen Moser wrote:
>> >> Dear Remi,
>> >>
>> >> thank you very much for the pointer to the patch. Sebastian integrated 
>> >> it into DD-WRT. Now the DynaLink DL-WRX36 runs absolutely smoothly, the 
>> >> WLAN links are stable, the packet loss is gone. No weird states anymore, 
>> >> independent from the group key exchange interval:
>> >>
>> >> https://data.saps.uni-ulm.de/index.php/s/NLNpWqjc8iGsaEM
>> >>
>> >> So your idea was a direct hit! Thank you very, very much. Several months 
>> >> of debugging have come to an end...
>> >
>> > So this is at least the second time this commit breaks a setup.
>> >  
>> > @ath11k why isn't this pushed to mainline ?
>> > This seems to be a clear regression, so even if there is no need to rush things
>> > in the long run this still needs to to reverted mainline right ?
>>
>> Good question, I don't have an answer to that. Could someone (also
>> outside of Qualcomm) send a proper patch ASAP so that we can solve this?
>> And it's good ot include the link to this discussion and describe the
>> symptoms the revert is fixing.
>>
>> This is the patch in question:
>>
>> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-keys-properly-when-DISABLE_K.patch
> 
> Not sure if I did it the right way but it at least is here :
> https://lore.kernel.org/linux-wireless/20250117191455.3395145-1-nico.escande@gmail.com/
> 


