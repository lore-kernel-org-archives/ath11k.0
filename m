Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25889C88E4D
	for <ath11k@archiver.kernel.org>; Fri, 11 Sep 2026 19:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=p1zqU+bZypQd0ZnCjsRJBhFbYZ
	g2sptOv13cMpypbHCckYgAKRio1U/C9wMreOeCmAS/+VP8zvCE0330KmJP2I+2k7dcdvm6RDWDCQf
	R27eoO+gRw4y1h2tAw0+QfJZm/d7aIHRhscD8LkGjsHd8iv6W4ba9O0Fd41UX0mxgTXGzQ6ox272M
	7SVsDPapZ9GpYPZ7ZLc5TlktQOcTNOK7reGFhvV51io3GyFKuwvhKhlhwdeoX5fS3OGAQGavrZO9B
	ebq2YLg8nNyY3qXae9VhgfpVJ5/aNZ0toipWoo3J+kJZkeXAqfsql1B0+OmIvtso+6w7CuUPnip1+
	GwqF/4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56mW-0000000HWa2-2DkL;
	Fri, 11 Sep 2026 19:19:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56mU-0000000HWZM-1G9z
	for ath11k@lists.infradead.org;
	Fri, 11 Sep 2026 19:19:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWmkx1462167
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 19:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=Gux0B5UbIvbrfSbG
	WCX/heFkRvUZQPCsQkJxJs6z9uWTzM8Aej7j1ybGt7NmcHA2OguMmVbD0NgqwuBq
	0N3u0x8yfaqAjas7TWFuxjrA1X0LLYDmzok3TSORTsxkp/dEdOxYWm+9UWyqn13O
	9dZsqi+l6sGyMIZSxbDYUzEOfvi+PyIVR3kpCKDPYBgzaX590uIFSb/7lIqMZDFv
	Uj+/Zx4UcuVYyMESulXadJsHbEq+rIdZN2gdrE/E05MooV35KpIssBgB1vQ5bU7Y
	Hw+iRLcSLrKuLoX+WtvwyZ3rgTu1ukdX2NeAjdLexrMz5/QLQZEsa8i4zur36xHf
	r0sshA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0dgdye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2293678a91.0
        for <ath11k@lists.infradead.org>; Fri, 11 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789154365; x=1789759165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=X8+qfLvpYiV+CCrCYib6A4HGihZ4aHvIKP+l3VDvuBsSEEGNSDEVmr1GwZgfYCFFtf
         9PxXcjHDXycZ/13DjRza571I2sW5bAm5g/dDW6mAEZW6V9v0pgze7yBX9kUbQkz9ct4n
         kYQe018EiFAZvxHaqXdD/0ogMjo1uV+bV0L/I8vV7PH2eiga7BAtULeZMGcSysJlDD55
         9iXfxpttY54AG9v/bsyQGVtMDsrfKsHfHYnst3eKSesgqkZ2aGEHgnGeSYfbUaRQvru1
         K3Py2mw4LmqlQ/PzDe8RQV/aa0L8LnmQDAsSn7Z1y5opYLEwUoJ7GB07LXb4czuMhjhq
         MsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154365; x=1789759165;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=YI1DGRqNPrVqct64vKKxxeJA0NwgY6GqmIDYVgD5iJVUyVuS8EbuFyfZWAas5JJ8ar
         bRxll+ABPMpajeQIrNuVHF6bYqqE3mz/YHoGbG3EEd2dSbcDdjcR72gyRWwSKbCx72gU
         NDrUhqqOW32OOgGXK29dcnM7WCKONeTTK7IYUUn1km61tuzFzWZ7qLvtxta/U8ywCh4Q
         lHT/l2GD+3z360Kzo3/Ayz7WTO0MzTnniMQ1SqKQCuCBdYk+VWRy6gADin0SmVEvHyGT
         auHSveHJjMp9NYAupYH2h97q6nTT5IQvlGlStcBYBY0/8Xuz8HyJU8pdOwhdLy4O3A6D
         K7AQ==
X-Forwarded-Encrypted: i=1; AKwUvByuXfk495I1xaTOQoAWcgj3KQ/MC0CFWzgz+C+pQzMYW2rLrmPmXa2MiQrBzccdEvW3Hg/sNY4=@lists.infradead.org
X-Gm-Message-State: AFuF++n/HknruJyA5MDVtC9vz4m7KQHJHwY4/4Zt048pUFWXq0mflbn2
	S1xQxxZD0p7L9/3bLGktC8bnQ4Uz4vKILsmEnpUbjEsEaRCPZjhNdvrADsjtgYrEXpHszUuotG/
	bjm/te6ha0eCTn/EBIk4SaaRNMCWpYGTt83nkRJX5qGQ3RjnMGr761A4U7Xq1wGsf
X-Gm-Gg: AYBFou28WAF9dJqJ6xYFqPqhM74SkxlqIfYPNEkDxwQ8y9VIXF2MCh6p37ltWIgZOrg
	Hg+19GclGZ6BajLuYhXv7RJdrF73fjJ+yHjU+K/XgvT/YfdNJbaNWgl6/Bvo8Mz5KvPKGnWM9ti
	NBWKNhMn9npKQI0Yq/XC15zqkAQ0gfu+c9Tfmk8xEIV4damh0+5Vb12F+dt1aw5HMD438czWxMo
	6WUwWDYRXTD+oq0SMvRaNLqymvaMeQ/P38Dqak98fifWHuaTiR3AEuRcGQVLL8E4pOjUAZDi3h2
	s3daQq7oyJgUuf28ewVJIOV2osc+Fo2aPw5HH8kPEHUJdqfWDXqyxLtI2mDIVPpgxxPU8IBLU8i
	kJarsW++W6DttbRQaZGvVATUPujTphp+X8n6dsgyvHeEJBeNYZystkk39qZvN
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183551a91.13.1789154364733;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183505a91.13.1789154364261;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm8253073c88.2.2026.09.11.12.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:19:23 -0700 (PDT)
Message-ID: <ee32feeb-e626-43ba-926d-5786aaf1d960@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one
 system
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Mihai Moldovan <ionic@ionic.de>, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
 <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7EHnuru c=1 sm=1 tr=0 ts=6aa4543d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=b6wZdvJBkCi_B7orZsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4kWAzHPLgDigls5LAVLcP9RWuRc2R2Hi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfX1Y0RCAOxrTE/
 mb/+6eM8eNf2PmZbDeKeinDl/Rg5MaXI4u4Yfyx9SW7tryMhBh7HavzZAtVdqWDWu4w1ZRk+3l+
 RdlZZLzx3GkTq29yimc41oo/yvVYFSI=
X-Proofpoint-GUID: 4kWAzHPLgDigls5LAVLcP9RWuRc2R2Hi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfX0qjRZXxR4nyz
 hbUx/Ri3pQxmA2YRSXn+0+mN+4OLnV3wg0mab0MAQriVCntIJAoYohWxPl3qm2P2nosTpDyDWu9
 AqRyE/1pVTFPXVZvChbvKKgGGq7udkRAD6mTPtmnbiKpNJZ4ioyGS+7XD+ikQU5yAYkkmDB5K5R
 i5eT8REBt20KlPz5eo+WucFdXiR/gVD0ILB+Z+8VCPWYkCAAvOAaTi/4APK89adH31aj76/fuei
 dKB7QmWIvTUQY8aTRUBMElrgzDmIR5g1nSGlSeNh0+qvalS0yPKrD99i2jtSGRXkiRM1ImwkHk7
 OfilHRaH8S5PrD/61HvsBMEgcNlYb91wMVLYj9vlgXBB/sYZwNgAKAi1poyZlKhcXA2zObo4nuE
 9SNbQpK6GJlTFwv1zWyZUUtuhb1llkFXWZwgocbqFDCKnAjkpqLlF0R6AHLyowkZHVQ1afwPMwQ
 54ZHQqzlGbWEJA8yIvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_121926_345150_58B6FD6B 
X-CRM114-Status: GOOD (  14.93  )
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

On 9/8/2026 2:44 AM, Juha-Matti Tilli wrote:
> On Tue, Sep 8, 2026, at 12:31, Juha-Matti Tilli wrote:
>> As you may well know, multiple identical ath11k and ath12k devices are
>> not supported in a single Linux host because they use conflicting QRTR
>> node IDs. Fortunately, Denis Kenzior created a patchset to support
>> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
>> refined it, after which I took over the patchset and refined it more.
> 
> Hello,
> 
> I am incredibly sorry by messing up the threading. git-send-email said:
> 
> 4.7.1 Error: too many recipients from 83.150.90.33
> 
> ...and failed at the patch id 8/12.
> 
> So I thought retrying from where it failed would be safe. But that
> broke the threading.
> 
> The next time, I'll increase the waiting time between subsequent mails.
> 
> Links to mails missed from the thread:
> 
> https://lore.kernel.org/all/20260908093437.2493698-1-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-2-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-3-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-4-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-5-juha-matti.tilli@iki.fi/
> 
> BR, Juha-Matti

Unfortunately this prevents many automations from processing your series,
including mine which utilizes 'b4'

* b4 am -3 -S 20260908093145.2492666-1-juha-matti.tilli@iki.fi
Grabbing thread from
lore.kernel.org/all/20260908093145.2492666-1-juha-matti.tilli@iki.fi/t.mbox.gz
Analyzing 10 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 44 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/12] net: qrtr: support getting new endpoint ids externally
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 2/12] bus: mhi: allow mhi to know about its qrtr endpoint id and
free it
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 3/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 4/12] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 5/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint
ID in qmi_sock_create
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 6/12] wifi: ath11k: add QRTR endpoint ID hif feature
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 7/12] wifi: ath11k: stub QRTR endpoint ID fetching
    ✓ Signed: DKIM/iki.fi
  ERROR: missing [8/12]!
  ERROR: missing [9/12]!
  ERROR: missing [10/12]!
  ERROR: missing [11/12]!
  ERROR: missing [12/12]!
---
Total patches: 7
WARNING: cannot prepare 3-way (series incomplete)
---
WARNING: Thread incomplete!

So I cannot evaluate your series.

/jeff


