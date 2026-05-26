Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212FCD5BD0
	for <ath11k@archiver.kernel.org>; Tue, 26 May 2026 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=; b=Lordblb1no/js4w9wAsWHDb63J
	2ueot4TZLRo5zc/rAWvO+m46crsO/tyWWBdzd7wPgbFSlsr3LWL0SqS3RnMp6B6URRL5m2LzQpSzA
	HeQy8P3NmNSJbCgvNgP8vWtvgh7LDxbFVxgbotTxvR1yR6DCN+SKj8EKhcrgA+Jvqrj0GlPNtigYN
	qTwmfvDb/K0XleLlPl18Q8fjywW2Sure0VvSVbWcbRPFsQwvQhwaEhXvjn1o6YTPbSVGX9C9ZHQWu
	x9rsRN25phQlkIpqebytT0ULKLqUYq03KM+ygmy6Of8gu/PpkGRFt3phk48HXYEVrMLr5ZP3hg6i4
	m8NqoxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq3l-00000001oIf-3ZqY;
	Tue, 26 May 2026 11:34:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq3j-00000001oHh-0uQ3
	for ath11k@lists.infradead.org;
	Tue, 26 May 2026 11:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779795294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
	b=X+VOOCHBPLPKsjaKrZYCJrqdeKMKq/0CExH2fF3OgoW+y0CoHU5AJ0Cgg4XfFyH0wTwUri
	2RhTtJDZjvZmOUugidupieE5lYgFf20Uru+vUxaRWS7HvxGlXIlvO1ZOj+UU2zuEByPmcc
	W2dcBKsQCPSC0BZSlmIYugi2BEcz/0I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-UeuaEO4UNj2kufERhIKkTA-1; Tue, 26 May 2026 07:34:50 -0400
X-MC-Unique: UeuaEO4UNj2kufERhIKkTA-1
X-Mimecast-MFC-AGG-ID: UeuaEO4UNj2kufERhIKkTA_1779795290
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48feb0298d7so84678015e9.1
        for <ath11k@lists.infradead.org>; Tue, 26 May 2026 04:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795289; x=1780400089;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
        b=Q04pOvL5TKePeWxzdKGi0tX/ijDfRonMzT9c2tM2mZlSlYNdXlnXicNX6xiWxjF7gq
         BvxwsKoS7m75Yo2Hf/1ocnmhDEcatrZX8PEKE71a2Zg7tAjLPfDVJ95V+xgL982MLKxY
         i7vgcB3UsK6D//fA8urcEiAd4GvBQwHZ3zsYQ28THCSn+slSR9xGAkEgeOu45ZWR0R8J
         AqNSveUix5kukVeKahiuY2AB40dJkQ1+3FCjWlUazDW9blt+rz7mvR+VLN3DnWv41N9z
         34I74U+qBM5bRtAQ+67W5YiksTyOBzSvU7BlSuF2jCvwhEHetIkIdgcBBOYD711eVv5a
         zO8g==
X-Forwarded-Encrypted: i=1; AFNElJ/vfkZ7dE9AEQcSZO8EgudR4s/4yjQEJLSFEJDh4z8qPoJij4x1inYUE40lnI3ckPkgF0Ts2Co=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFcVvQ54V0bQH8pUqpNfZ1ehnsloCD7ul5OFaKdPRsZK4BoFGB
	2HIXvHd6UiEXzQVnYvVEuuzNBVe0PewqfVMSXlAapzJ4KQj/NxGZM/i9w4aSO5vcNcsdgjbh2bQ
	1TWpBOmB1AKHTSEYjIJ2DjzibuUwrqPUZeWpzUqaDQXsio0VPpNFCb+KTNY++zIw=
X-Gm-Gg: Acq92OED9AlUqvFQRwIMm867UkMTL+JhonuJyZxlnqcPEa/hGuV0fzFndMTu/a1M8PJ
	JvsjRJGXDVsPSyohJttXsJvC4NiTK9fj+DOOrEO+CQ+qwewDVwb0797A2cpTeG/oJIYdCVylnvF
	BwxP1VxG4rM7c0YeIwtRQVhydrVuiw6tIOTmvIBrx6Eyvb1tQWVbkheLdTQaLkQYOed6pv0mJzY
	SoF3xmF1JVkribQ2i+mw1LsyFrqcaj/PIaNnHNgxOzLm/fNjqBbWQ7rOAxG68pNFZ+kG+uyhCZh
	BfwTkPHiBBfbPhxRXU0gYih1wKgnnqVmnRKhEb0uyuxGv2WoVmv/0qevRrqlZDzhrIqqMr3/DMg
	pUwS2/EF85Iphmcy9IAo4BtxLPaI/2bTVRqy8NVRUab9vNdukWj8h9BhRyg==
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275107645e9.11.1779795289609;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275106815e9.11.1779795289064;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm565711385e9.1.2026.05.26.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:34:48 -0700 (PDT)
Message-ID: <5a54d307-0b8c-468d-9183-6433f9daba56@redhat.com>
Date: Tue, 26 May 2026 13:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
 <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aWp1H_pjnFWM6lC3p5sjAvIfJxR6PNCveTcHTyISJQI_1779795290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043455_355211_63E70669 
X-CRM114-Status: GOOD (  20.50  )
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

On 5/22/26 10:09 PM, Loic Poulain wrote:
> On Fri, May 22, 2026 at 12:01 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>>
>> The mhi_net driver does not coordinate with runtime PM, which allows the
>> underlying MHI controller to be runtime-suspended while transmit, receive,
>> or RX buffer refill operations are in progress. This can lead to stalled
>> transfers or failed queueing once runtime PM is enabled in the MHI core.
>>
>> Add runtime PM reference counting to the mhi_net data path to keep the
>> controller active for the duration of TX, RX, and buffer management
>> operations. Enable runtime PM during probe and take/release references
>> explicitly around these critical paths.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8..5d7f9ccdb17b 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/skbuff.h>
>>  #include <linux/u64_stats_sync.h>
>>
>> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>         struct mhi_device *mdev = mhi_netdev->mdev;
>>         int err;
>>
>> +       err = pm_runtime_get(&mdev->dev);
>> +       if (err < 0 && err != -EINPROGRESS) {
>> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
>> +               pm_runtime_put_noidle(&mdev->dev);
>> +               goto exit_drop;
>> +       }
>> +
> 
> I am wondering what the value is in pushing this PM responsibility to
> each individual MHI client driver and requiring every MHI operation to
> be bracketed with runtime PM handling.
> 
> What does the client driver know here that the MHI core itself cannot
> handle centrally? It feels like ensuring the controller is
> runtime-active during transfer could be handled generically in the
> framework instead of duplicating the same logic in every client.

Indeed if *feel* like the MHI core should be able to put together all
the status needed to correctly track the PM.

Adding PM tracking to the NIC driver network data-path looks quite bad.

/P


