Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEBFC9830D
	for <ath11k@archiver.kernel.org>; Fri, 25 Sep 2026 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=; b=YD4PvIHQehHMMNIOtcfxtoNwry
	7DNkPeu44NizDm3Ww4ia30lTk4wM6QdEDtf8NHi0Ln3fSNWkvQmrwa4Cfw18yDGnOWDADMuZV2/Ix
	8cU/3cgqufE20EphhUSLE9W7o4LrYxqCsXtLzGR4C6H+yDfYncU7zOLqtzQ2ixKaTTpicDfjMsbO6
	4wOVHE6EMK3BgBaICMF/00eC+GaqZhr4Gezjeynl5POUKjjgw5iEiC7NpoYHndj9LgWXUp9Gh4NbI
	rcdwTqCWoTy7V4Clq469BftQOCyREbCGqNUZosi9eTamycqXvsQBjqRDBse+f57iKoMnmQXSTM1T6
	M636DywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7SO-0000000Dgei-1JZd;
	Fri, 25 Sep 2026 15:03:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7SL-0000000DgdQ-2Fr8
	for ath11k@lists.infradead.org;
	Fri, 25 Sep 2026 15:03:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDrEhT600050
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 15:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=; b=h0AvOe/a9dWJbUP4
	ona6pb8Pkwg4EnpW5lblO4R3CV+S2Etp+jiL3JrMTpwBb/M6WjyAX1o0k+UBTXx7
	6e8FWrepwZNvx43PqbCfBRGm3gEXMrgyfmdqPM9E6LajwWchW7IMlxDWFrTtVNcF
	ukLCPuk9BRAgMxxWlIMMVzfxqo/6ZaRCbhg5jii00koOq43Jn7BodqrtwLYGLeN6
	3e6UKAHUhQwm/bsfUOaXNdQ7yVtRNoK7ogfiMTldrwhiOrkLGh6rJKH097JwTtni
	aHjgan48Yw6REMefCc6M/fU3qICaDXFeK133iTXWFEwWszehpzAqARwGmm7jg5mX
	UoW8JA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsuas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 15:03:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-880ed9b2e60so14034b3a.3
        for <ath11k@lists.infradead.org>; Fri, 25 Sep 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790348599; x=1790953399; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=;
        b=atu90LnoAw8pQ3blV+h1tKCKxo/P9ScbTWbP+8rQwHnoJWdoMhdz7qfeIxrST9XtE7
         sXdS0STujnzZmC2yOHzeukbzchDAl7SKUhgB9ZHCsxXTb08ziUcelBjVXQFSOpcoSWBJ
         XKfCu+mEUEeWNsEby1izLtpU1xMWtXjIiH064nJpVVN2AJCg/XhcMNszkMiNfhvUK2SA
         MBWoj5JRMpa+3td5qE3yh00kONue0U7OzyplIUMEFw1drx9wbqgdUX3TE6VkRp42NuS5
         TlNQ2dGQE5TerypwXEIT4RzG4ZM5CxXrUg/frMUu5AiFl8gSUnZDElp9XsOdHp/VooLM
         fkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348599; x=1790953399;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=;
        b=UCrKF34z6pVm4wYZcCnukCA/WjjzXmDmBPrQgDXPVTND/n8hKqD10WsPtjH4rXeKca
         cQuuNZFstW1HnUmXxPQWiYzG9brbsOtvFizQBX2vYq8WeYXXymupLL8qf6Fn0Ito2Npf
         LWRJtcQZErcYoRsiQLZ/mIGqpIwTY/SXVQjBTYU/e74L8vrph60DRqnsMUng2Z54zmXD
         wHK1ie98mhRnkApeoLnrl/K5oBGYx0nEZmPWppyjdEPV8BRBP/N27NYacxX8TZbq9wTN
         zJHAjV7usRyb5ZS8qNMHJRMpr/USDDLML3LBLHM20R9om4seEIJPCQRfNp0n2zYK8AV9
         j6Bg==
X-Gm-Message-State: AFuF++kRxpnS0RC45s1axJ8CrYYbRnOW9COMDBH1QjvtxKHRC+Ak5NAw
	6NlJnwEvFtZvgHhjJk8F76N+nRxnuu4yNC9fjMX/6h6T2XL6l1Y+CXlUlxs0zjEBKpbPqTI2WgC
	XJbsWmknNAujGMeNGHO8zZOvTveofqBBSHRAEm/vdubrsUW1t0AOJ7YeE7+nrkqFc
X-Gm-Gg: AYBFou00HmCV7WZIsUU3qhyPWk/NyAByIKPoRD2oyA5xMzXk+BgASS8dX2Gddli9BlQ
	dRYgnKU/CqTfgUYk0ygnhv0loE5vTknLyh5tZpCXYXJEW+ej/GM3dcMql+19FlbNriCEl9ANdDr
	56b0Z/IAmka5U4scQtBgLzndPvvP+Jh4gEuuzSuh+OSMOL2IUP4jzPEBePLac3LyYfPW1MEIglu
	6sunHzkYRPFzSPvxWMESrfgg2gvpj45hPVwsPCxXI416oiTBYBeISe9aURxKDliYiJzqu7V94s1
	aWNt+eMSFqEpjm2FCmRcB03ntCVWYJ04cwqb1jxYqelqyeHU4x+E8SRQAhAbaVtK6Ob6NP+cyiq
	f2VGIP61Ke4pO9srAz6q9MdscLAeajn2quisKIiqPK3qhN3GwCy+BwPHZy9IH
X-Received: by 2002:a05:6a00:2283:b0:86b:43f6:67b7 with SMTP id d2e1a72fcca58-87e9898de76mr4761003b3a.4.1790348598949;
        Fri, 25 Sep 2026 08:03:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:2283:b0:86b:43f6:67b7 with SMTP id d2e1a72fcca58-87e9898de76mr4760950b3a.4.1790348598304;
        Fri, 25 Sep 2026 08:03:18 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb583422sm1324979b3a.50.2026.09.25.08.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:03:17 -0700 (PDT)
Message-ID: <3ea7e9ab-ed3a-4e6a-9006-b6f6af51c1fd@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:03:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: Question about active scanning of DFS channels
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>, Jouni Malinen <j@w1.fi>
Cc: ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        hostap@lists.infradead.org
References: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 59qiikiw0YASre7nPBWsi5g3MuIVKDyR
X-Proofpoint-ORIG-GUID: 59qiikiw0YASre7nPBWsi5g3MuIVKDyR
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab68d38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ePHqwv-1doYRykRbqMUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1OSBTYWx0ZWRfXxaA+4By816KQ
 5PZz+gweSLtnFk9gqNxT2SX60QYav1VaOgB9RBV3kA/9W5TuU6ryw1Cs77Pm2Jk8nbOHEVjO3Gh
 iI7Tk1lAT19BwqilUjFd4ROEd6dhW7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1OSBTYWx0ZWRfX2cYF5AinraQl
 elWKH14USHD6uwRuOdkMbVIDZS1Xm2abfMXvEbl99X5G34YFvY27kkrbJ63v+eTuC+z5wXls4sT
 57dfAn8NdwD+3DtpmF1nFsLhPpbdLzHeAh5uZPKNFANRIE48+VSjUNx5pLPDweBy3g0tIjKjx73
 iqrXJhQlF3ZCJ5HvQpM4+PTuGmQum/0kSdgo/RzTBkdCEhE5KSC+S9yscTF7Xl7VNbnHSRmIgA/
 0q/VEjUs+eemzsDR8rUOxn/Y0z+s7FpwawjLwKgVKLOa2PksSb9FVLBW+rGxExY+v/tkBkRoPgu
 C4irJc6zV2TYsZK69HOFTEPLteBbB33gBpPGdAiIYJLv0CqV8/n9KMqWPGPlPiNun7j0ENnW9+V
 +HFaL6b+v6b+1jBS3SED9frR2plqu57k4I1LwDpSVx89gTwUpOuCucZZTmGqdUMF/SePJ4l8tlv
 uRGLTQg2j2/PAGhx0iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_080321_709602_238C9A85 
X-CRM114-Status: GOOD (  14.38  )
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

On 9/25/2026 7:00 AM, Alexander Wilhelm wrote:
> Based on my research, DFS channels cannot be scanned passively, so I used a
> sniffer to verify that the "directed" probe requests with given SSID were
> actually being transmitted.

In general that isn't correct.

For starters, everything related to DFS is gated by regulatory rules. So the
operation of the client device first depends upon whether it is configured for
operation in a given country, or if it is configured for World Mode.

If configured for World Mode, then initially DFS channels can only be scanned
passively. A client device in World Mode must not transmit on a DFS channel
unless under the control of a master device. To do otherwise violates
regulatory rules in many countries. So the normal process is to perform
passive scan on DFS channels and process Country elements in Beacon frames in
order to determine the country in which the client is operating (aka perform
an 802.11d scan). Then the client can switch from World behavior to
country-specific behavior.

But even when operating in country-specific mode, whether by the initial
configuration or by processing Country elements, a client cannot transmit on a
DFS channel unless it is under control of a master device. If a client
receives a beacon on a DFS channel, then that channel is considered to be
under control of the master device that sent the beacon, and only at that
point can a client device actively probe/authenticate/associate.

Further complicating the issue is that some regulatory bodies have rules that
govern under what conditions Country elements can be used to determine the
current operating country. In particular, the FCC has rules which require a
device to maintain all FCC restrictions unless multiple criteria are met (I
don't remember the exact rules but seem to remember that at a minimum there
cannot be any master devices sending beacons with US Country elements and
there must be multiple master devices sending beacons with the same non-US
Country element before the device can be consider to be located in that non-US
country.

/jeff

