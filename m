Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED1DCD8CA8
	for <ath11k@archiver.kernel.org>; Tue,  9 Jun 2026 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGn80Czw+Q8aNgWthHK97QTsMBMg/HtanGxumcKLgUM=; b=iKYes2RdYJ1btDx+wsl4wgLBwC
	YF+yYfYlIEv2Rzi6G9nH7/P9yXdHR1J0EscfummMHbgmFqaxFi4+WcSrfWVw7q+2/st4j7wL/ALcw
	+59jGkjvqFxRCrBDHP/VqMVezuOrJ7Zo8goyQKN2608dU2o/DxvzCYDhTuuiBF34561ulqZecxeMk
	z7HCNV64YVSHhGMzCNUUnpPlOXVBFS/4LBvsA3OYI2sxM2E5LqJ6O4gKJ/z6yXZJUj1zea8Zm5phg
	ctrpe5wazQzrKk/m35cRfE62vpnRts4JiSkHy3DFlrSh0J7dtyF1Zfj3GQsDytaj98Ug11yEnlx89
	f/yAZ+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuCW-00000005P9D-0RO0;
	Tue, 09 Jun 2026 11:00:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuCS-00000005P8r-1zJ1
	for ath11k@lists.infradead.org;
	Tue, 09 Jun 2026 11:00:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xLa42208855
	for <ath11k@lists.infradead.org>; Tue, 9 Jun 2026 11:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGn80Czw+Q8aNgWthHK97QTsMBMg/HtanGxumcKLgUM=; b=ROLS+Rf0RgXL7Gvn
	tkk8FHreJAvZqLmANpC9Cqsjv4rLZno2Hp4Xb+0FGvV6Gf7TUuZHcgyeDfXhFBDY
	b/KAn2USklQFfwhU+8eCn56An2IqQeaIbyy79jTXUdHJxBgvl5tOQ4JE8R7hgqkL
	n4WwzQxKGvVtN4/1z29X3Qi0LXzCSuhGyYYj6kIK7VhWmFKA4kW7XGUFxUENsYf6
	kk1DDCD8ROHxI4hckxJoymPl9retNx7KIYSFioTf31F7EZDqBNyZlo7dRK9clnLo
	C2j5Bb0Yml+Ib6QrndeDwj7rXGu0WmMQ8iAkPLR+ki9ntHijhP5KE7Ze7zVK/BXK
	VI4p9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4guar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 11:00:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so74501615ad.0
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781002850; x=1781607650; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGn80Czw+Q8aNgWthHK97QTsMBMg/HtanGxumcKLgUM=;
        b=Q4smJrIbV45whJrNCJK2EZvxqKmodkN2ONlyWdWHLIx5Hmz9HTfZuYXxzcn406GEaU
         9LQHWi1XBUUtd/e6WcKi14ZIgtAWRmpkaN4hR2OcExRyH0kxDCQGJP1eujg/x9I11/j1
         cBTT6WSUbCTFeZ7hBEP3F7tG3oOEm6LfKdKN5NOwAeBcW8S5DVrwOs0xpEmf/5RO+sqV
         DCV48SYl2g/1RAgbuOYAKaKzY2JJ8niCj2PKs5nCxmapWTkM6SE8MAhpRmB13a1pBRHL
         a8JcfmwY+PWFd2N4V/7riw6AEkyet8zgofddqvr6h98OhhUyy29K1vcsmTNRgBW00kku
         dIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002850; x=1781607650;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGn80Czw+Q8aNgWthHK97QTsMBMg/HtanGxumcKLgUM=;
        b=m4kKcle83H9U9G4zA6n+ZwLdifCDcluINAJ4Y3XfK67qirLi2hMtrZhHZ0A1U1AQVu
         +kf+BfA6fwpKxZVwOGtDMRy6M9c0nPWTX70SD9ENePE1KFyBIdh81H6C8GfbZd/LUOTN
         KYoWBbpB8ii6tvXHcIe74Mhqvewd/yz/yN4AyyxMM1qYS0lLvO+pqVl7C63qcn8Bt8du
         u4KxJwZneQU0se+MnPl1MHPDHCwitgeXLUixeGkwwk5DzO/5PrP3JdaevTXDZIUltWCe
         IlEFnB8OfF90mMaOhdXjCOZ2jZxhhRJRyzuUfRFark5oKdXllJF04uNrp0xtpAsTBbWR
         wvuw==
X-Forwarded-Encrypted: i=1; AFNElJ+fNUpoMgpFjBF/3pgOhLhzzzOPDcFfxXZbDZLlDBUfKTp2BMIgACxcZ+I0E6TTCjLhce8Eda0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy58mfWJYX7LeHeqGFZU+BUs9YiAtvj7BEeOScOAAjWdQF5Q2KJ
	v/yUceHAXxXc1Tp07Ub7JcWBGmmHi8wcGoEO+ijNIDY6mdAK6SLUp3L44HZOWfsZLMWisCJEm4x
	IAwcfpQ/xRUiItDW8etT1OCgzJUqhrVj8CVF457Z35mshT0la/pAoFBLG4teH0DAd
X-Gm-Gg: Acq92OEGlhHHbff4JJY/i+FzilVjMRIaY0o5ZdR0T5AT5mVL1eDMHrditLKDaZOXzLL
	KQaFTLSygja9M8tfKXMS/UlXJRHzLOa54Wxh2FSsG2RA1R1BQkRI4dpsfjyYH9KTqlQJjEhyV8N
	Ykf7YQMUe0qYxB+SXbjzwLkSuFj+R/aEU4qOHKtwfMKAwS2m7K9sD59l2Exyh8hNB+zNR9pAqAC
	jAgXO4dl7yxVn3rHZA4o/lhHSMFd4cDnzrZH8pPcHwMQMOLkTadHLpMjpNWz7QY3jaCSqdU3AWX
	DATGcIdivi4JrKpwIlx8YcxaFUu4K9+dy1LhxfJ2EBt1QyFPqp9Ij13AaWnqvi4hAbxfL2MJh1t
	mI6JGZVls3x4MyHGzIrkT2H8U0138tiF80vMjf0MjCvxRx3z5OChf0Z38EBe2sxHntmkyMrZv
X-Received: by 2002:a17:902:f541:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c2a1bb43e7mr30141235ad.1.1781002849604;
        Tue, 09 Jun 2026 04:00:49 -0700 (PDT)
X-Received: by 2002:a17:902:f541:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c2a1bb43e7mr30140895ad.1.1781002849195;
        Tue, 09 Jun 2026 04:00:49 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm211576805ad.22.2026.06.09.04.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:00:48 -0700 (PDT)
Message-ID: <6545e04a-eded-42a2-b773-92d9e9ed2226@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:30:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix refcount leak in
 ath11k_ahb_fw_resources_init()
To: Wentao Liang <vulab@iscas.ac.cn>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260609092528.220547-1-vulab@iscas.ac.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609092528.220547-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27f262 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q36DTRNDronnURX6cDEA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Z4UaXWhKlkwnisI9s0SjjsWMLLcKJ5Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwMyBTYWx0ZWRfX91Of3Z6Bbb68
 hr9TQYvdy/e+r4Gd25U9nGUMqk0dUjRQMn7kzyX4ZKwui9RW5ahN6nYVp7QN6zg+ESBhQtmQ1+m
 2Dtme6FZfPVpf7f0JmkuwcOUGP0nTVZYP34O0pcgR8oj23JlpZjQZ2xl3pXuolxSoraZT8LKv69
 DndQSOkYnymQomG1Oz3m7sWZfVt2YJNMlpDcQK3doaLiVVpKAsQcHanTLSRKxeuPhxmzJ8jSPJ6
 hkYCXFo5r0G2l0n2vsa9Mkg5T2Sy3NqGbsa0+v8l1MQtXNmjJJhRyaGZkSp8Joyw7hY98gTStFV
 mc7jbPNS4vrIOLfXpL3qrSJ9/EOZy8QTdTO62MDQPn7E5n1pWLH/lGprEJjavewrwVtq5qVVUwz
 IbAWPDW/F03arkfdAESyhB8gfHW28R3s84MRyRZXOCZ/0ISz4uWwBBxy4SfWhP3JoPBV1fMDmv3
 yRCTZ2qYQPZZzjqGr5Q==
X-Proofpoint-ORIG-GUID: Z4UaXWhKlkwnisI9s0SjjsWMLLcKJ5Ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_040052_663071_76504D65 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On 6/9/2026 2:55 PM, Wentao Liang wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, but the error path when ath11k_ahb_setup_msa_resources()
> fails does not release it.  Add the missing of_node_put() to avoid
> leaking the reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: 095cb947490c ("wifi: ath11k: allow missing memory-regions")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

