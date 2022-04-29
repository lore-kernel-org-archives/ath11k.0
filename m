Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58CCC433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqfKkplUPxU4mn9NQ7UkDr/8ChLsx0m7Rp/b4XUXqBk=; b=mHj6dSjOAO1Z/V
	18vw6D6DHHcj5hsxxWwxoidF3FEfoF/WV0NEOHascsHipCPzFM0Z1NloFOh0ICCA6xXWoEZSSnNVt
	P2k1HRXZ5zuvbTQ+gBHbJC+FIP3lwGUsFSSlAzRTpGzqp2+GOQ3Iu4f+VJP4wrIBfFHmUmMVPhp6V
	54HygQIsjxLY2tZsp/3QI9ySf9F2fQ8zZbNFL7fOwoEC2BXvY1Gz031JhNgOvKJB02DxKncqrlrJk
	tb//2IHNt8z4/XNMzD5FMgwnbEE9GQhezwIEdEW9pYouqnxQ/2t6KVKzcx3aAPozYHN/heuHbnPvb
	g4f9VAWm4QiuPZNgNI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNbk-00Af3A-Cj; Fri, 29 Apr 2022 10:12:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNJ1-00AX0L-7V
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 09:52:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2B1B622CF;
 Fri, 29 Apr 2022 09:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCE5C385A7;
 Fri, 29 Apr 2022 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651225974;
 bh=4dX3RZKOAnpU33fOLqblNxRSAKqlEVe0S6NJCykWw3g=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PV+lTtIAj27xwe/KlxXM8OCFDfRtERz2sAgqWHIvCZ9/Yfk1MLe3MT/5VT+rvQoGy
 T/bt4tEQ8GI72joQDVBWouhGtI8vSosrPPcqM3yamjxAG9JZzrfcybY9+co3dT5+I7
 zMw57GgGEgc3MANlJJa0TVJJKlfLUSdPxjX8WaoyKuUNf4xUA9KNq4tda0OjNmYYUN
 lFJUp16QdS1giYeyAOfD6asLvGGYYdTdQSRC1WOLldVF0ftLlLOCHjrM5ABTN79NKm
 p6FQgAwUYX9LPhqdc54orx1tPnPDp9WeWOT/rzUqDmc5OaO+4jNzht2eIpX89bfdFf
 N3jx6PkslIDGA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v6 4/9] ath11k: Add register access logic for WCN6750
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
 <20220427111848.9257-5-quic_mpubbise@quicinc.com>
 <87pml2g1c7.fsf@kernel.org>
 <6e607455-e42a-a591-f58b-b3b2c83ea2cc@quicinc.com>
Date: Fri, 29 Apr 2022 12:52:49 +0300
In-Reply-To: <6e607455-e42a-a591-f58b-b3b2c83ea2cc@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 27 Apr 2022 18:56:33 +0530")
Message-ID: <87h76cdxn2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_025255_405113_EEBAFF6D 
X-CRM114-Status: GOOD (  16.86  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

>>> @@ -704,11 +718,26 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>>>   {
>>>   	struct ath11k_base *ab;
>>>   	struct ath11k_pci *ab_pci;
>>> +	const struct ath11k_bus_params *bus_params;
>>>   	u32 soc_hw_version_major, soc_hw_version_minor, addr;
>>>   	int ret;
>>>   +	switch (pci_dev->device) {
>>> +	case QCA6390_DEVICE_ID:
>>> +	case WCN6855_DEVICE_ID:
>>> +		bus_params = &ath11k_pci_bus_params_qca6390;
>>> +		break;
>>> +	case QCN9074_DEVICE_ID:
>>> +		bus_params = &ath11k_pci_bus_params_qcn9074;
>>> +		break;
>>
>> Now you are making bus_params device specific, that's not really the
>> point of bus params. They are supposed to be _bus_ specific parameters.
>>
>> Can't you use hw_params like I mentioned in the review?
>>
>
> Even without this patch, as of today, bus_params is already device
> specific with QCN9074 changing the static_window_map in bus_params to
> true in ath11k_pci_probe().

Yeah, that's a mistake which slipped in review.

> And if we have to move these device specific bus_params to hw_parmas,
> then bus_params can be pretty much removed completely with the changes
> that WCN6750 bring in. Any thoughts on this? I can make the changes
> that can get along with WCN6750 series.

My original idea with bus_params was to there are bus specific
parameters and that way we could simplify hw_params. Clearly that's not
working and I agree with you, bus_params should be removed. So it would
be good if you can do that in the next patchset.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
