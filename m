Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF3C433F5
	for <ath11k@archiver.kernel.org>; Wed, 16 Mar 2022 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9Xgx8ncQH8vA1IpAWY5g3u8Y9moiAoyHlzYQm4iHBQ=; b=TS8Hf/BQKqicOL
	FEZ8uFctg08wGe6WlXF66e+FWmGecp2ZPIjhO4zt0m/ryGvjsFRn3PHBuWNFftrNrC+U3g6FvkLcQ
	wlohKAMjtPwg/EPQ8EKBexCf9G/ppRrSC6ztmaVdeHawxJ3lWcnFCiyTpjgxFJnW1hK5xUDHnqE2w
	n5FqUb0HP66B5Qk1zKNNM0PbESk94bI/7GmOp5sIcl/otFTVO65bwstEDA/eg4k8pneZdWQoaKpW1
	FqzgD8HpZ2AG8YsM8SbB39VLFGysVOo75t+rqdYVvYb5Hbt6DdaWXcBdeoG6NRzynk8QLbogDstme
	iipG5/CGEep9ktyWhC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUmy-00DICS-Ix; Wed, 16 Mar 2022 14:38:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUmw-00DIAy-Hq
 for ath11k@lists.infradead.org; Wed, 16 Mar 2022 14:38:11 +0000
Received: by mail-ej1-x632.google.com with SMTP id d10so4596316eje.10
 for <ath11k@lists.infradead.org>; Wed, 16 Mar 2022 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4iSmUHIOPBD0fcLO6IuI2tphiUvxfBd0934UBJsqoj0=;
 b=SwyIemCt+49VWK90LkHY/jN8LhiJsB70Ne0K9hsJdsG692mjTytfibNIamFhHI6BII
 u9l4vcTqkqU7le5pvu8poS6oQ1+BakgtEMGRxXnq+39eJgeKP0UV7sUWuVuJAv2jG7hx
 pwIVaEqk6X3CUj5ZJoZsTtMgGyN/zKRzVCuBlVCbcsLYZRBxUwgXIcxUpgxGxrpXiCLb
 GG5taT1LUU8xmVG0XLA517+4s63vmMNyRX3SwdMf9UPXwtYPL722BDNCE8N7CjNSLl5U
 TnXfh5a8BzXxkYwOTJVwMrIbPWIZRb5AutYbEY/t/vpOmo7x4krpt5PsgYklhas7JNta
 YnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4iSmUHIOPBD0fcLO6IuI2tphiUvxfBd0934UBJsqoj0=;
 b=hZmbCU1bNZcfXTOETo47rp8Rdu4yMHUrQu4sDEyNsGaBWjvyRQ8VDtj19FsmSMv/hz
 kxy5qu4bxQ294bm0zO2Vigg/CBimVS6au/ObD7n1zN9M0hy8jgXCIrmwnvvPs77q2WIF
 Vo4phV+9//8RkE02904BDn25ihgkKgGRwwPMXs8upTx/UVvhUeK4my8ecrZcEvgp2hM8
 2AHu2IudhOR9UnDULoTaCScwiCVSCN/KxR1vba+/vYAlNqP3qi7k4lNOFTKnMYV3fIij
 ct6kCtEfrTWlOJksNfhk6F2nD2aMJEbu1nd0ruolC8HmZAQSxXii6a9UzLlw4UvBedFp
 H4Ug==
X-Gm-Message-State: AOAM532TriNlln1QS9Qzi8b9IC0QssJdmWfwElhYvSWWVC3Zf45g7jZ1
 wKg5wLaj6ThEcBwwTyUw0ns=
X-Google-Smtp-Source: ABdhPJw5SlJp0/OYIZ6AN5dcFyugvC61um588FYH+ineRhV1j0gOS+CdDslhRiQfR7WVqKBbzQppgA==
X-Received: by 2002:a17:907:2d2a:b0:6db:7298:8d4c with SMTP id
 gs42-20020a1709072d2a00b006db72988d4cmr199112ejc.679.1647441488760; 
 Wed, 16 Mar 2022 07:38:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:cc83:eef0:7bf1:a0f8:a9aa:ac98?
 (ptr-dtfv0pmq82wc9dcpm6w.18120a2.ip6.access.telenet.be.
 [2a02:1811:cc83:eef0:7bf1:a0f8:a9aa:ac98])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a17090677ce00b006dbf0aaf4a6sm1015970ejn.56.2022.03.16.07.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 07:38:08 -0700 (PDT)
Message-ID: <10c35486-55f4-f907-cbe3-c1a33a0710aa@gmail.com>
Date: Wed, 16 Mar 2022 15:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
References: <20220314215253.92658-1-dossche.niels@gmail.com>
 <87o826pgqr.fsf@kernel.org> <c0874b06-116d-7471-3b50-21099c729c3d@gmail.com>
 <87k0cuotjo.fsf@kernel.org>
From: Niels Dossche <dossche.niels@gmail.com>
In-Reply-To: <87k0cuotjo.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073810_640530_826B6D01 
X-CRM114-Status: GOOD (  15.34  )
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

On 16/03/2022 15:34, Kalle Valo wrote:
> Niels Dossche <dossche.niels@gmail.com> writes:
> 
>> On 3/16/22 07:13, Kalle Valo wrote:
>>> Niels Dossche <dossche.niels@gmail.com> writes:
>>>
>>>> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
>>>> held when calling that function in order to protect the list. All
>>>> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
>>>> acquired when calling ath11k_peer_find_by_addr. That lock is also not
>>>> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
>>>> The solution is to acquire the lock when calling
>>>> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
>>>>
>>>> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>>>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>>>
>>> On what hardware and firmware version did you test this?
>>>
>>
>> Thanks for your reply.
>> I am currently working on a static analyser to detect missing locks.
>> This was a reported case. I manually verified the report by looking
>> at the code, so that I do not send wrong information or patches.
>> After concluding that this seems to be a true positive, I created this patch.
>> However, as I do not in fact have this particular hardware, I was unable to test it.
> 
> Ah, I didn't realise this. If you are using a tool to find errors in the
> code it's always a good idea to document that in the commit log. I'll
> add an edited version of what wrote you above in the commit log, ok?
> 

I will make sure to write that in future commits, sorry for the inconvenience.
Adding an edited version of what I write to the commit log is okay for me, thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
