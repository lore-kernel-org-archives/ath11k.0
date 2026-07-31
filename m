Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E62C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixYtCl0NvsYGQOXtWDzVtKDRbS/OCvPCvl4JZPIeVDs=; b=27izeGrZ9LycMMTYO5TAB6ThmQ
	1ph4BQe0kvsbdDadYYV6YHdNVBVBe52odr+qlpDV9+P7DdBj2SByQSpYH80y/aZl8GPkZ2ZwGayVi
	o7ZJAkZbcXx1Nxv7poiV3EfsfBW9PjhKjFdj7GaH3DT1WPOdhLKxPHrGs4NkpCbegROiGdOjzikYg
	2JwFt5AkEL6ni5YRLwugQ7ulGI6VCkwDGRpdeDivMwgcK2A2AH7kcGvpRXJTNUv2xxIK58xs7xoqq
	qqAYYSkVeyvMT7esYMDbOTb+pOImdRE+6joRrszOCHYeAx3+QIioDOh6A4JrIKf9Y7ZoDnI+8SjZF
	H7jQNVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoAz-0000000ChPz-2HWG;
	Fri, 31 Jul 2026 14:25:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoAy-0000000ChPQ-09DG
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 14:25:29 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c15cd3fd760so126192266b.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507926; x=1786112726; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ixYtCl0NvsYGQOXtWDzVtKDRbS/OCvPCvl4JZPIeVDs=;
        b=BpWRzBMWRCCqAZos8BECJpV+sWnAyrr7zvFEgTC72Li2/T76Hc9HYVcX9NOOB3K4v0
         g635VZo3INLZ7b4sEaluh2/vrxODWPGVdwDJflAsWDJDf3RGPZ/fK7aUqV9X7rIoHfeG
         4h4KTx8rI4c2L5g5o/YP4aO3hzGJXwmk7sBSlBi70kqFBG6h5UaEA7xGBvmF8rqUFhIq
         0s5Xw5Dot8pdH0B9XBMzem1A62pIc6y0e475N3hgfDXy6013THiPUjovs4ObN6li2sYw
         abdhDy5bvA8d13nV1FUQgAkwcAWxLu2XImWSWgijuEHka2Ww7Ww7/UQcNk1wIZD6VPle
         6w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507926; x=1786112726;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixYtCl0NvsYGQOXtWDzVtKDRbS/OCvPCvl4JZPIeVDs=;
        b=pDtawiLnVgy/ILIYvaKw8F8gdMh3SEboMO0hAw3H84hZoUf76LH9AI8e02UzuVuWlJ
         aPep6cqaFyfZ1PtkO6SiH/ciezO0s2fcuAvqFhEATJhR15m9ZG3JZRvkPL3c+ltyL4jD
         yXsXtpd9kV3nVsDvUYUcK1q/l1o4GjAcPsouBCwjJhwR4uTlMOPQ9HLN+bAlmmvnmq6Q
         a0hT/HvCyOxZ6wTDgmHgoyxRuGstmxKkaZex0BtZbsrX9jcDfdY5qFYw9jyT0CPxz0ha
         f0gyXmHK/PQgDzuCBT13/WMQ0iB+ye2NcpeQBncvE3cJs35Py616nRcbIdHLCwwE13y9
         RaUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru378fxrC3QH7gWwlrRBrmrVqWES3voL9NcgRYEEEXnMiM+k14B8XVX5Pk6i7OP8gTT/J9F3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyznfPF7WAqGMnnsLGjGEJOF0tg9jDSggw04yqsioRrBDy3J/D
	U7/o7oF8xkhi5k/SvZKCT8u3qDNmzstDjcPwbcaLYQR3RuFV53/IBDTC
X-Gm-Gg: AR+sD10JVmSzTWvYWv4wKcJBPOvrLQB0P7ub6GCDfLLouJA12OWFJ6KFKdz3vdZuoU5
	CTK+o39fx1Caw0jgdXkbk+mM5zwhHPW1Vw470n9sBI6C6Q4+x8zC1ay+i8BCI0i1fg0gZzWoV7c
	aWEwaegx2stBH9IvgZQZpZhUpZ/FZhN5XN7SE2zzku1rlYpiqPstWtGprI8+3pYT+XMC6oa/Ta4
	DIhhVGAdhy+FjLcCFJSKWLg6JF0DiRzttJxYHLWOIlfKCzpUDTkRhm1W7LiXf4kbT2bkMoYxQaV
	egzsPEf1kIPYWNNoPTm0pu7JHBT0wtYXUdw/JAamjKxb8rxomOWxK8ROmwiy6kf176Rwypia8AA
	A1fOjqoTO6lY6Ca7STqgrDq/7vCq6hC2a1zqE7rwRGf4sL5iXd273FQQwN7D+V7N+LZbStvhwIh
	lJYnz5iBQ0sAzH6PBwy2EIbajyV2gX9iBdZCWbd1RrFx60mNtxYZemX2e/95yoT6lA/2p6nzhBX
	gRYoo4=
X-Received: by 2002:a17:906:ee8a:b0:c15:ef0a:adb4 with SMTP id a640c23a62f3a-c1fd2712598mr129574166b.61.1785507925579;
        Fri, 31 Jul 2026 07:25:25 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd455f671sm149757266b.57.2026.07.31.07.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:25:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 16:25:24 +0200
Message-Id: <DKCTQGTORU5H.H4ANSP32B0PU@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260730140306.133718-1-nico.escande@gmail.com>
 <4160b5e1-c82f-4083-aa36-18e4a42f909a@oss.qualcomm.com>
In-Reply-To: <4160b5e1-c82f-4083-aa36-18e4a42f909a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_072528_122211_A48BD302 
X-CRM114-Status: GOOD (  18.41  )
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

On Fri Jul 31, 2026 at 7:41 AM CEST, Baochen Qiang wrote:
> s/ar->num_station/ar->num_stations/ in subject
>
>
> On 7/30/2026 10:03 PM, Nicolas Escande wrote:
>> When (multiple) hw restart occurs, we end up in a situation where we
>
> by hw restart do you mean firmware crash and then recovers ?

Yes firmware crash indeed.
=20
>
>> cannot accept new stations / mesh peers. This seems to be the
>> 'num_stations' in 'struct ath11k' that did not get reset properly in
>> this case. In ath11k_mac_op_start(), it was indeed the only accounting v=
ar
>> that did not get reset so let's clear it too.
>
> the root cause description looks confused to me: if it is firmware crash =
and recover, we
> should run the path ath11k_core_reset() -> ath11k_core_post_reconfigure_r=
ecovery() ->
> ath11k_core_halt() -> ath11k_mac_peer_cleanup_all() and in that function =
ar->num_stations
> is cleared.

So about how I came up to this fix:

When I first saw it I though I would be able to reproduce it using the
debugfs simulate firmware crash feature, but I was not. Then from the logs
I had at the time I noticed that there were multiple crashes back to back,
sometimes while still recovering from the first one. I think thats why I wa=
s
not able to properly simulate it and find the race condition leading to thi=
s.

In the meantime I wondered why we hit the num_station checks and not the
others like num_peers for example, and found that it was missing in
ath11k_mac_op_start(). So I made this change as I do not see how it hurts,
and I've never hit the issue again.

>>=20
>> This avaoids problems like those:
>
> s/avaoids/avoids/
>
[...]
>>=20
>> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
>>=20
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices"=
)
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
[...]
I'll spin a new revision with all the feedback taken into account at some p=
oint

