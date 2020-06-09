Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiV2W-00086h-HZ
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 03:35:06 +0000
MIME-Version: 1.0
Date: Mon, 08 Jun 2020 20:35:01 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 00/12] mac80211: add multiple bssid support
In-Reply-To: <20200604070952.15481-1-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
Message-ID: <dbf176d11cb4110a0a0bf6e29d68c409@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-04 00:09, John Crispin wrote:
> Multiple bssid allows us to share a single beacon amongst several VAPs.
> This essentially safes airtime. This feature is achieved by adding an
> additional IE to the transmitting VAPs beacon. This new IE contains
> the additional SSIDs and their non-inheritance information.
> 
> This series is still missing handling for TIM, which will be sent in a
> follow-up series.
> 
> John Crispin (12):
>   nl80211: add basic multiple bssid support
>   nl80211: add attributes for multiple bssid related settings
>   nl80211: add attributes to set beacon transmit mode
>   mac80211: add multiple bssid support
>   mac80211: add multiple bssid IE parsing
>   mac80211: propagate multi bssid settings when starting an AP
>   mac80211: propagate beacon tx mode to the driver
>   ath11k: pass multiple bssid info to FW when a new vdev is created
>   ath11k: add a struct to pass parameters into ath11k_wmi_vdev_up
>   ath11k: add the multiple bssid IE offset to the beacon template
>   ath11k: set beacon tx mode
>   ath11k: set the multiple bssid hw cap
> 
Great work :)

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
