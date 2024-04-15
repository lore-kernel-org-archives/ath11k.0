Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C6EC00A94
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ/gU6Zovz3SCdVzBwiei3aQGP9xcp2+0bM+w6udNkA=; b=zW9xt9vbGJ3+Y/u1+oev0nQQzZ
	5Q6arYAKxLsE6N13z0lMHRXKWnIFvDELjxZf0zCpRdNBuK3/APcV4YZxpj9I9ZxHyArn1g2W+Q/MB
	0/E6UbCr/w9gwe1YHMDpO1zJtHuBh3xmwY8Gg9o2wxcHzV1TnSIxcVIxkPboAGpToDYLFLlh3S07n
	aeID29o8oMMsDCJ0z/0CUfqgq7R5fmpYSFtyxFfEz3RlLJVDQRUr58cSTrAl1p0EpW50iz7Q38R95
	WtJwoAU8Kd/pAzw36Umky3LNSJbfKCcOF9VD90A1eLg1OU7LnXp4KI8mNIGMvGMAb+wRcLzO6Pjg/
	hWEJDZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOqz-00000008zm9-1Be7;
	Mon, 15 Apr 2024 16:06:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOqs-00000008zig-026y
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 16:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6CD3CE0E0D;
	Mon, 15 Apr 2024 16:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837A3C2BD10;
	Mon, 15 Apr 2024 16:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713197193;
	bh=63edPZGvTejQU5Y0eC42owDzMIedIHDtuS1pEqj8Sy8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kXktyWh2HUDWg2oZ4MgYYoWgziCuftsEglZ1213wbAkO8tOpP8WlxmEsgBD556d0K
	 23riC/5P8StOGGomfCZaWLhvkoSUkqIe0hlPj6w9fSg5ecKTl//tq5hd9sjH44ZzRI
	 PZgvmavzvvkMKzUY6+SHZWBuwgJhT9RABRIYHevLNPzIPfFwGOV6dMudGc5py5wDjB
	 1ao8w7ybV2XzYTH7ys9z/zl+Ic3b9+C2JfbydhvY3w8Y91s0OEV4IJXa/KGa9nyspy
	 KUfKultJ2lZ/MVgYPa8vPFg8BQ/hqQJmFIlV/9DUXstcePc/Px+A8NQYAd2GB+eVzW
	 l+fXTwm3E2kDA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,  Robert
 Marko <robimarko@gmail.com>,  <davem@davemloft.net>,
  <edumazet@google.com>,  <kuba@kernel.org>,  <pabeni@redhat.com>,
  <robh@kernel.org>,  <krzysztof.kozlowski+dt@linaro.org>,
  <conor+dt@kernel.org>,  <jjohnson@kernel.org>,
  <linux-wireless@vger.kernel.org>,  <netdev@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <ath11k@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath11k: support DT ieee80211-freq-limit
 property to limit channels
References: <20240412162510.29483-1-robimarko@gmail.com>
	<20240412162510.29483-2-robimarko@gmail.com>
	<4a1e0cb6-c319-4eb1-9bd1-5ff13eabfe1b@isd.uni-stuttgart.de>
	<c7106c8e-0c99-4160-966e-b1a8ba5770ee@quicinc.com>
Date: Mon, 15 Apr 2024 19:06:28 +0300
In-Reply-To: <c7106c8e-0c99-4160-966e-b1a8ba5770ee@quicinc.com> (Jeff
	Johnson's message of "Fri, 12 Apr 2024 13:53:02 -0700")
Message-ID: <87ttk2y5iz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_090638_320472_CC570457 
X-CRM114-Status: GOOD (  10.60  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/12/2024 12:52 PM, Christian Lamparter wrote:
>> On 4/12/24 6:24 PM, Robert Marko wrote:
>>> The common DT property can be used to limit the available channels
>>> but ath11k has to manually call wiphy_read_of_freq_limits().
>>>
>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>> 
>> I've seen this before.
>> 
>> https://patchwork.kernel.org/project/linux-wireless/patch/ed266944c721de8dbf0fe35f387a3a71b2c84037.1686486468.git.chunkeey@gmail.com/
>> 
>> (dt-binding too. it has/had an ack)
>> https://patchwork.kernel.org/project/linux-wireless/patch/fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com/
>> 
>> sooo.... this is awkward.
>
> Patchwork indicates Changes Requested
> Any idea what changes Kalle is looking for?

I can't remember anymore but most likely I assumed based on Krzysztof's
comments there will be v3 and missed that Conor already had acked it.
Sorry about that, I set Christian's patches to New state now so that
they are back in queue. And I'll drop Robert patches. Does this sound ok
to everyone?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

