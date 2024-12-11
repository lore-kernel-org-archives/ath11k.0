Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66DE7717F
	for <ath11k@archiver.kernel.org>; Wed, 11 Dec 2024 02:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2amnVrhJyNTdPfi+li73e2jRRi7A5M0l5Intio2miik=; b=sN14J4bGO3P09DxBJsmZ0lEfFP
	GmEJB1HTjtjLXXZraCUn7Us5k+Jv8kPt+H20E6uHfvpzOJsTx1K/gL2i5wYFScDf73Z7WnQjQuRl3
	KS0NF6aPUnAKZecZ57X8VhNy0hVS4nZmOZQhbTLTVi1LajJEWikuszHoqU9xRiyekG6Z3i1B5LFfS
	0xHa38nk3Cnit9+zoyDT+X9K04gkA6zK5wx6w4/6QpJTwDFTraCo5YKziy+IaCyBd42YwKBoj7UU9
	O4RgwvwbScLygUow7mF3V3NtbPdi6PT9YBSa/Sk5MJJY1IXKQGB9cjvmOhRQPu9TP1qE+ChL+qW7n
	b4CUEQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCBO-0000000DU2i-35Bk;
	Wed, 11 Dec 2024 02:10:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCBM-0000000DU2L-1UHX
	for ath11k@lists.infradead.org;
	Wed, 11 Dec 2024 02:10:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB1fJx3014853;
	Wed, 11 Dec 2024 02:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2amnVrhJyNTdPfi+li73e2jRRi7A5M0l5Intio2miik=; b=eLXwuQ6QUjWrJptK
	y7bblKBipQLusBt1tKkuU8Fjj7z8VDgS/XD6HED6lfGBRZE79xsUMV/dpodLMJHM
	0WjhpsSGrYufAfz836cmLiGP2NpLRST3LAXGAM04JiI3xpKrcArRiviIyykqKXh4
	xE/tcmtDh8mA+bhshpFheRt9CiGLP59U8nE40hTjITYSU535OQxb65qlshdxk0Bw
	MU81bYRgw0QwbjNcYQm9O0i3ItP7xvY91iU05rRAXOk8b+pzoGZOPkhE1VO2Mkd5
	h8TJXQFx3U6cFGaxn97OXy/G9lnvxkF7XLwSaQBHyWI59ZetSLQOKDkFShMhVpeK
	41mhsA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3nbcwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:10:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB2ASJZ012332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 02:10:28 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 18:10:25 -0800
Message-ID: <d8705140-e335-47e0-ac70-47d8592fb18c@quicinc.com>
Date: Wed, 11 Dec 2024 10:10:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <quic_cjhuang@quicinc.com>, <vbenes@redhat.com>
References: <db61f998-2524-4623-8b0f-143661507e38@quicinc.com>
 <20241210084419.126723-1-jtornosm@redhat.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <20241210084419.126723-1-jtornosm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D2iBK7HZnT67Bwi170oWgKBPTAmm2BtO
X-Proofpoint-ORIG-GUID: D2iBK7HZnT67Bwi170oWgKBPTAmm2BtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_181032_405374_C46FEC92 
X-CRM114-Status: GOOD (  15.45  )
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



On 12/10/2024 4:44 PM, Jose Ignacio Tornos Martinez wrote:
>> Yes, Can you pls share the complete steps and commands?
> Sure, I offered it before.
> 
> You need NetworkManager and of course NetworkManager-wifi packages installed
> and working.
> We are using Fedora/rhel with the default configuration and you can configure,
> before the next steps, the wifi interface as sta from NetworkManager or not
> (with no wifi configuration the same result happens) because it is going to
> be unmanaged.
> 
> After booting (wlp1s0 is the wifi interface for ath11k and there are no other
> wifi cards in the system), here the necessary steps with our network
> configuration:
> # nmcli  device set wlp1s0 managed off
> # ip link set wlp1s0 up
> # ip link add name wifi_br0 type bridge
> # ip addr add 192.168.254.1/24 dev wifi_br0
> # ip link set wifi_br0 up
> # iw dev wlp1s0 interface add wlp1s0_0 type __ap
> # iw dev wlp1s0 interface add wlp1s0_1 type __ap
> # systemd-run --unit hostapd1 hostapd -dd /tmp/hostapd1.conf
> # systemd-run --unit hostapd2 hostapd -dd /tmp/hostapd2.conf
> # dnsmasq \
>      --pid-file=/tmp/dnsmasq_wireless.pid \
>      --port=63 \
>      --no-hosts \
>      --interface=wifi_br0 \
>      --bind-interfaces \
>      --dhcp-range=192.168.254.2,192.168.254.205,60m \
>      --dhcp-option=option:router,192.168.254.1 \
>      --dhcp-leasefile=/var/lib/dnsmasq/hostapd.leases \
>      --dhcp-lease-max=200
> 
> After booting I get the same issue just doing:
> # nmcli  device set wlp1s0 managed off
> # ip link set wlp1s0 up
> And the step that you commented in a previous answer:
> # iw dev wlp1s0 interface add wlp1s0_0 type __ap
> # iw dev wlp1s0 interface add wlp1s0_1 type __ap
> # hostapd hostapd1.conf &
> # hostapd hostapd2.conf &
> 
Got it, you use Networkmanager, so that the add interface type will 
always be managed. But it's still work fine in my device that I use 
"hostapd hostapd2.conf" to up the second ap.

So could you share your log about it? Enable debug and tracer about 
ath11k and mac80211, and share the the recorded trace?

> You can use whatever hostapd configuration (with the suitable interface name).
> 
> Thanks
> 
> Best regards
> Jose Ignacio
> 


