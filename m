Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE08C77B73
	for <ath11k@archiver.kernel.org>; Wed, 24 May 2023 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTZGxJqb4yv35DOtfjrW4slr7oyoqdqVZPMsG+YKQJw=; b=bb/so77tM8zHlt
	l0tf3DXNPs0E5SGRifGIJcgUCs/8jtcxjUjHg+fzve9NA42MD8baT1Cghv9mXmf+UEq8xlqolIXf0
	UeqLuh/1+MVKcOU5SlA6Vdob3tEDJTbqkpGHZkchiQB4go3KmE7NPMGZePKnh0vnsaLlUouDqsvCM
	AUvO+AvSqwnrWLtI67WesD8wmapbBOjflvL9p2r8BqrCexgzEOrPXONvXwct8Q5DddqSxA5n34bar
	seJqLcGOh/JyvEXG+mGTYoPZm91zdI/uVeZVUZpQbNULNoQcoXf6d8PJSz5paIsXb3Hu2b2ou/T6m
	dfHqgSNf1hxCwlGiq3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kuv-00Czna-32;
	Wed, 24 May 2023 09:36:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kut-00Czmr-1o
	for ath11k@lists.infradead.org;
	Wed, 24 May 2023 09:36:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCAB262828;
	Wed, 24 May 2023 09:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA40AC433D2;
	Wed, 24 May 2023 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684920982;
	bh=3RDAmXbPpZPlOZLbdKiVZC4UxcSl6x7J31OGNvXq5Rc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bmJlENkBDccadjEH4PGKANOqT/6lqCbALQYInWsgBP5OJU+zonwS9F0jnSYtH1Kj/
	 UFt2W3H7a3OUEoqry9N6asPSLTOKBh4brdVAIr4Uil5ARjtjAq14hphcJn7IQ8JM8A
	 Tyt1FOYiLwGvN7BscozZ8uwFzSHsCp311RbTSigiVbdR4AT48o5VcXd9qT2t96qvYM
	 M8yI+M3iPuNBAo3xODQRHVK915onOprsEHBJXBy1Ere1iW+DI64jZ6NGCUc9b7V+Q8
	 t3hduGP9XDxw8BHRhfY950yyL3Rdc2phE0vsn0FrgNRqCuTKho4oQOTSR9qedIaW8X
	 JxNRFNGOPKZLA==
From: Kalle Valo <kvalo@kernel.org>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: Tyler Stachecki <stachecki.tyler@gmail.com>,  "open list\:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>,  "open list\:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,  <quic_akalaise@quicinc.com>,  <quic_mpubbise@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath11k: Add rx histogram stats
References: <CAC6wqPVvke=Gy59yvYcaps2dwVzO=wfwdSTGNxFzAOWc5OpoDw@mail.gmail.com>
	<d6f794e3-7463-da7d-721e-00869faf4c17@quicinc.com>
Date: Wed, 24 May 2023 12:36:16 +0300
In-Reply-To: <d6f794e3-7463-da7d-721e-00869faf4c17@quicinc.com> (Maharaja
	Kennadyrajan's message of "Wed, 24 May 2023 14:33:03 +0530")
Message-ID: <87h6s2kr5b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_023623_646563_321927CF 
X-CRM114-Status: GOOD (  18.11  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> writes:

> On 5/21/2023 11:21 PM, Tyler Stachecki wrote:
>
>> Was this really tested on QCN9074 as the commit text suggests...?
>>
>>> const struct ath11k_hw_ops ipq6018_ops = {
>>> @@ -1132,6 +1147,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
>>>   .rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
>>>   .reo_setup = ath11k_hw_wcn6855_reo_setup,
>>>   .mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
>>> + .mpdu_info_get_mpdu_len = ath11k_hw_qcn9074_mpdu_info_get_mpdu_len,
>> ...
>>
>>> +static u32 ath11k_hal_rx_mpduinfo_get_mpdu_len(struct ath11k_base *ab,
>>> +       struct hal_rx_mpdu_info *mpdu_info)
>>> +{
>>> + return ab->hw_params.hw_ops->mpdu_info_get_mpdu_len(mpdu_info);
>>> +}
>> I think you want to put this under qcn9074_ops. As of now, when
>> QCN9074 is present, it attempts to jump to a NULL pointer as
>> mpdu_info_get_mpdu_len remains uninitialized for qcn9074_ops.
>>
>> And, do you not need to define mpdu_info_get_mpdu_len for all the
>> other hw_ops? If so, please be careful about defining it for
>> WCN6855/WCN6750 as there was a recent regression due to how the RX
>> MPDU info is provided by those firmwares as it differed from
>> IPQ8074/QCN9074. I personally do not have the appropriate literature
>> to determine whether or not this is consequential or not here as well,
>> though it seems like it would be:
>> https://lore.kernel.org/linux-wireless/20230404072234.18503-3-quic_youghand@quicinc.com/
>>
>> Tyler
>
> Thanks for your comments. Will fix this in the upcoming patchset.

I have some comments as well but I haven't been able to send them yet. I
recommend waiting for them before sending the next version.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
