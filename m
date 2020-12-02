Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkbsf-0006Kr-E8
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 23:49:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id x24so65296pfn.6
 for <ath11k@lists.infradead.org>; Wed, 02 Dec 2020 15:49:52 -0800 (PST)
MIME-Version: 1.0
From: Stephen Liang <stephenliang7@gmail.com>
Date: Wed, 2 Dec 2020 15:49:39 -0800
Message-ID: <CAE+mCOEX5ccBa2HBYpi_3YpayApyr-C1csBpvvjWZ-hnW38Oqw@mail.gmail.com>
Subject: Re: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

For reference, I am running Fedora Rawhide kernel 5.10.0-0.rc6 with
commit 59c6d022df8efb450f82d33dd6a6812935bd022f and a revert of
7fef431be9c9 patched in.

I am able to connect to WiFi and did not receive any immediate
freezing, hard kernel panics, etc. Uptime is now going on 35 minutes
and able to get 50 up/down throughput.

I  do see a number of taints in dmesg while connecting to an access
point but the taint doesn't seem to affect functionality, for example:
https://pastebin.com/raw/gbzuvs3q

Finally, rebooting the computer does require a hard power down.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
